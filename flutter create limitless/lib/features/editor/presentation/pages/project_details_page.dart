import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/models/project_model.dart';

class ProjectDetailsPage extends StatelessWidget {
  final ProjectModel project;

  const ProjectDetailsPage({
    super.key,
    required this.project,
  });

  IconData _iconByType(String type) {
    switch (type) {
      case 'photo':
        return Icons.photo_outlined;
      case 'video':
        return Icons.videocam_outlined;
      case 'audio':
        return Icons.music_note_outlined;
      case 'motion':
        return Icons.animation_outlined;
      default:
        return Icons.folder_outlined;
    }
  }

  String _typeLabel(String type) {
    switch (type) {
      case 'photo':
        return 'Photo Project';
      case 'video':
        return 'Video Project';
      case 'audio':
        return 'Audio Project';
      case 'motion':
        return 'Motion Project';
      default:
        return 'Unknown Project';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cloudWhite,
      appBar: AppBar(
        title: const Text('Project Details'),
        backgroundColor: AppColors.deepBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.cloudGray.withOpacity(0.8)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.deepBlue.withOpacity(0.12),
                    child: Icon(_iconByType(project.type), color: AppColors.deepBlue),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: AppColors.deepBlue,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _typeLabel(project.type),
                          style: const TextStyle(color: Color(0xFF5F7480)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.cloudGray.withOpacity(0.8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Progress',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.deepBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      value: project.progress,
                      backgroundColor: AppColors.cloudGray.withOpacity(0.5),
                      valueColor: const AlwaysStoppedAnimation(AppColors.deepBlue),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('${(project.progress * 100).toStringAsFixed(0)}% completed'),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // later -> open proper editor by type
                },
                icon: const Icon(Icons.play_arrow_rounded),
                label: const Text('Continue Editing'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
