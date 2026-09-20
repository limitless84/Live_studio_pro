import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  IO.Socket? socket;
  RTCPeerConnection? pc;

  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();

  final config = {
    "iceServers": [
      {"urls": "stun:stun.l.google.com:19302"}
    ]
  };

  @override
  void initState() {
    super.initState();
    _initRenderer();
    _connect();
  }

  Future _initRenderer() async {
    await _localRenderer.initialize();
  }

  void _connect() {
    socket = IO.io(
      "http://localhost:4000",
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket!.onConnect((_) {
      // Join as CAMERA
      socket!.emit("join-camera", "studio_room");
      print("Camera joined room");
    });

    // Host sent offer
    socket!.on("offer", (data) async {
      await _handleOffer(data);
    });

    // Receive ICE candidate from host
    socket!.on("ice-candidate", (data) {
      _handleIce(data);
    });
  }

  Future _handleOffer(data) async {
    pc = await createPeerConnection(config);

    // Add local camera stream
    MediaStream stream = await navigator.mediaDevices.getUserMedia({
      "video": true,
      "audio": false,
    });

    _localRenderer.srcObject = stream;
    stream.getTracks().forEach((track) {
      pc!.addTrack(track, stream);
    });

    // Set remote offer
    await pc!.setRemoteDescription(
      RTCSessionDescription(data["sdp"], "offer"),
    );

    // Create answer
    RTCSessionDescription answer = await pc!.createAnswer();
    await pc!.setLocalDescription(answer);

    // Send answer back to host
    socket!.emit("answer", {
      "target": data["from"],
      "sdp": answer.sdp,
    });

    // Local ICE
    pc!.onIceCandidate = (candidate) {
      socket!.emit("ice-candidate", {
        "target": data["from"],
        "candidate": {
          "candidate": candidate.candidate,
          "sdpMid": candidate.sdpMid,
          "sdpMLineIndex": candidate.sdpMLineIndex,
        }
      });
    };
  }

  Future _handleIce(data) async {
    if (pc != null) {
      pc!.addCandidate(
        RTCIceCandidate(
          data["candidate"]["candidate"],
          data["candidate"]["sdpMid"],
          data["candidate"]["sdpMLineIndex"],
        ),
      );
    }
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    pc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera Client")),
      body: Center(
        child: RTCVideoView(_localRenderer),
      ),
    );
  }
}
