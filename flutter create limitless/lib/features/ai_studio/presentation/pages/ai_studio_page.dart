import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../shared/widgets/primary_button.dart';

class AiStudioPage extends StatelessWidget {
  const AiStudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.aiStudioTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'AI Studio (Generate, Enhance, Auto Edit)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              title: 'Back to Editor',
              icon: Icons.home,
              onPressed: () => context.go('/editor'),
            ),
          ],
        ),
      ),
    );
  }
}
