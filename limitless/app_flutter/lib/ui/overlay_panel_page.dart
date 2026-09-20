import 'package:flutter/material.dart';

class OverlayPanelPage extends StatelessWidget {
  const OverlayPanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Overlay Panel")),
      body: const Center(
        child: Text(
          "Overlay options will appear here.",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
