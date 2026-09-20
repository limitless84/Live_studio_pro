
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import '../webrtc/webrtc_manager.dart';

class LivePreviewPage extends StatefulWidget {
  const LivePreviewPage({super.key});

  @override
  State<LivePreviewPage> createState() => _LivePreviewPageState();
}

class _LivePreviewPageState extends State<LivePreviewPage> {

  final WebRTCManager manager = WebRTCManager();

  @override
  void initState() {
    super.initState();
    manager.connect("studio_room");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Preview")),
      body: GridView.count(
        crossAxisCount: 2,
        children: manager.renderers.values.map((renderer) {
          return RTCVideoView(renderer);
        }).toList(),
      ),
    );
  }
}manager.socket.on("director-select", (data) {
  String camId = data["cameraId"];
  print("AI Director selected camera: $camId");

  

manager.socket.on("director-select", (data) {
  print("AI Director > Camera: ${data["cameraId"]}, Shot: ${data["shot"]}, Transition: ${data["transition"]}");

  // TODO: اجرای ترنزیشن واقعی (fade, zoom, cut)
});

