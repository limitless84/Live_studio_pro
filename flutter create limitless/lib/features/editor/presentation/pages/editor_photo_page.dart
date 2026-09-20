import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class EditorPhotoPage extends StatelessWidget {
  const EditorPhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _EditorBasePage(
      title: "Photo Editor",
      subtitle: "Crop, retouch, color, filters",
      icon: Icons.photo_outlined,
    );
  }
}

class _EditorBasePage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _EditorBasePage({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cloudWhite,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.deepBlue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.cloudGray.withOpacity(0.8)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: AppColors.deepBlue),
              const SizedBox(height: 12),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.deepBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Placeholder UI — API & engine later",
                style: TextStyle(color: Color(0xFF6B7D86)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
