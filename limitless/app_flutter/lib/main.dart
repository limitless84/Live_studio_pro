import 'package:flutter/material.dart';
import 'ui/home_page.dart';

void main() {
  runApp(const LimitlessApp());
}

class LimitlessApp extends StatelessWidget {
  const LimitlessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Limitless Studio',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
