import 'package:flutter/material.dart';
import 'ui/home_page.dart';
import 'ui/live_preview_page.dart';
import 'ui/camera_switcher_page.dart';
import 'ui/overlay_panel_page.dart';
import 'ui/settings_page.dart';

void main() {
  runApp(const LimitlessApp());
}

class LimitlessApp extends StatelessWidget {
  const LimitlessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Limitless Studio Pro',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/live': (context) => const LivePreviewPage(),
        '/switcher': (context) => const CameraSwitcherPage(),
        '/overlays': (context) => const OverlayPanelPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}

