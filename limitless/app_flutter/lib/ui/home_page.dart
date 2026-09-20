import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Limitless Studio Pro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/live'),
              child: const Text("Start Live Preview"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/switcher'),
              child: const Text("Camera Switcher"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/overlays'),
              child: const Text("Overlay Panel"),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              child: const Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
ElevatedButton(
  onPressed: () {
    Navigator.push(context,
      MaterialPageRoute(builder: (_) => CameraPage())
    );
  },
  child: const Text("Open Camera Client"),
),

