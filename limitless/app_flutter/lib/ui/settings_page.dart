import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const Center(
        child: Text(
          "Settings screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
await http.post(
  Uri.parse("http://localhost:4000/api/stream/start"),
  headers: {"Content-Type": "application/json"},
  body: jsonEncode({
    "rtmp": rtmpUrl,
    "input": "program_output", 
  }),
);
IconButton(
  icon: const Icon(Icons.settings),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const StreamingSettingsPage(),
      ),
    );
  },
),

