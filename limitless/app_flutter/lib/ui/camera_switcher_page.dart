import 'package:flutter/material.dart';

class CameraSwitcherPage extends StatelessWidget {
  const CameraSwitcherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Camera Switcher")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _cameraButton("Camera 1"),
            _cameraButton("Camera 2"),
            _cameraButton("Camera 3"),
            _cameraButton("Camera 4"),
          ],
        ),
      ),
    );
  }

  Widget _cameraButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
