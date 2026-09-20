import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class WebRTCManager {
  late IO.Socket socket;

  Map<String, RTCPeerConnection> peers = {};
  Map<String, RTCVideoRenderer> renderers = {};

  final Map<String, dynamic> config = {
    "iceServers": [
      {"urls": "stun:stun.l.google.com:19302"}
    ]
  };

  Future connect(String roomId) async {
    socket = IO.io(
      "http://localhost:4000",
      IO.OptionBuilder().setTransports(['websocket']).build(),
    );

    socket.onConnect((_) {
      socket.emit("join-host", roomId);
    });

    socket.on("camera-joined", (cameraId) {
      _createPeer(cameraId);
    });

    socket.on("offer", (data) async {
      await _handleOffer(data);
    });

    socket.on("answer", (data) async {
      await _handleAnswer(data);
    });

    socket.on("ice-candidate", (data) async {
      await _handleIce(data);
    });
  }

  Future _createPeer(String cameraId) async {
    RTCPeerConnection pc = await createPeerConnection(config);

    RTCVideoRenderer renderer = RTCVideoRenderer();
    await renderer.initialize();

    pc.onTrack = (event) {
      renderer.srcObject = event.streams[0];
    };

    peers[cameraId] = pc;
    renderers[cameraId] = renderer;

    RTCSessionDescription offer = await pc.createOffer();
    await pc.setLocalDescription(offer);

    socket.emit("offer", {
      "target": cameraId,
      "sdp": offer.sdp,
    });
  }

  Future _handleOffer(data) async {
    String from = data["from"];

    RTCPeerConnection pc = await createPeerConnection(config);

    RTCVideoRenderer renderer = RTCVideoRenderer();
    await renderer.initialize();

    pc.onTrack = (event) {
      renderer.srcObject = event.streams[0];
    };

    peers[from] = pc;
    renderers[from] = renderer;

    await pc.setRemoteDescription(
      RTCSessionDescription(data["sdp"], "offer"),
    );

    RTCSessionDescription answer = await pc.createAnswer();
    await pc.setLocalDescription(answer);

    socket.emit("answer", {
      "target": from,
      "sdp": answer.sdp,
    });
  }

  Future _handleAnswer(data) async {
    String from = data["from"];
    await peers[from]?.setRemoteDescription(
      RTCSessionDescription(data["sdp"], "answer"),
    );
  }

  Future _handleIce(data) async {
    String from = data["from"];
    await peers[from]?.addCandidate(
      RTCIceCandidate(
        data["candidate"]["candidate"],
        data["candidate"]["sdpMid"],
        data["candidate"]["sdpMLineIndex"],
      ),
    );
  }
}
