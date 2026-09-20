import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StreamingSettingsPage extends StatefulWidget {
  const StreamingSettingsPage({super.key});

  @override
  State<StreamingSettingsPage> createState() => _StreamingSettingsPageState();
}

class _StreamingSettingsPageState extends State<StreamingSettingsPage> {
  final TextEditingController _rtmpController = TextEditingController();
  bool isStreaming = false;
  String statusText = "Not Streaming";

  Future<void> startStream() async {
    final url = Uri.parse("http://YOUR_NODE_SERVER:4000/api/stream/start");

    final res = await http.post(
      url,
      body: {"rtmp": _rtmpController.text},
    );

    if (res.statusCode == 200) {
      setState(() {
        isStreaming = true;
        statusText = "Streaming Started";
      });
    } else {
      setState(() {
        statusText = "Error Starting Stream";
      });
    }
  }

  Future<void> stopStream() async {
    final url = Uri.parse("http://YOUR_NODE_SERVER:4000/api/stream/stop");

    final res = await http.post(url);

    if (res.statusCode == 200) {
      setState(() {
        isStreaming = false;
        statusText = "Streaming Stopped";
      });
    } else {
      setState(() {
        statusText = "Error Stopping Stream";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streaming Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("RTMP Server URL",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: _rtmpController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "rtmp://youtube.com/live2/xxxx-xxxx-xxxx",
              ),
            ),
            const SizedBox(height: 20),
            Text("Status: $statusText",
                style:
                    TextStyle(fontSize: 16, color: Colors.blue.shade800)),
            const SizedBox(height: 30),
            Row(
              children: [
                ElevatedButton(
                  onPressed: isStreaming ? null : startStream,
                  child: const Text("Start Stream"),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: isStreaming ? stopStream : null,
                  child: const Text("Stop Stream"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
