import 'package:go_router/go_router.dart';
import '../../data/mock_projects.dart';
import '../../domain/models/project_model.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class EditorHomePage extends StatelessWidget {class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 148,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cloudGray.withOpacity(0.7)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.deepBlue.withOpacity(0.12),
              child: Icon(icon, color: AppColors.deepBlue, size: 18),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColors.deepBlue,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF5F7480),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  const EditorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cloudWhite,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.deepBlue,
                      Color(0xFF11485A),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.deepBlue.withOpacity(0.22),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Limitless Editor",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Create without boundaries — Photo, Video, Audio, Motion",
                      style: TextStyle(
                        color: Color(0xFFDDE8EE),
                        fontSize: 13.5,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Quick Actions
            SliverToBoxAdapter(
              child: _SectionTitle(
                title: "Quick Actions",
                onSeeAll: () {},
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 108,
                child: ListView(children: [
  _QuickActionCard(
    icon: Icons.photo_outlined,
    title: "New Photo",
    subtitle: "Edit image",
    onTap: () => context.push('/editor/photo'),
  ),
  _QuickActionCard(
    icon: Icons.videocam_outlined,
    title: "New Video",
    subtitle: "Trim & effects",
    onTap: () => context.push('/editor/video'),
  ),
  _QuickActionCard(
    icon: Icons.music_note_outlined,
    title: "Audio Mix",
    subtitle: "Voice & music",
    onTap: () => context.push('/editor/audio'),
  ),
  _QuickActionCard(
    icon: Icons.animation_outlined,
    title: "Motion",
    subtitle: "Keyframes",
    onTap: () => context.push('/editor/motion'),
  ),
],

                
            // Recent Projects
            SliverToBoxAdapter(
              child: _SectionTitle(
                title: "Recent Projects",
                onSeeAll: () {},
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate.fixed(
                  const [
                    _RecentProjectTile(
                      title: "Travel Reel 01",
                      meta: "Video • 1080p • 02:14",
                      progress: 0.72,
                    ),
                    _RecentProjectTile(
                      title: "Podcast Intro",
                      meta: "Audio • WAV • 00:32",
                      progress: 0.38,
                    ),
                    _RecentProjectTile(
                      title: "Food Poster",
                      meta: "Photo • 4K • PSD",
                      progress: 0.9,
                    ),
                  ],
                ),
              ),
            ),

            // Tools
            SliverToBoxAdapter(
              child: _SectionTitle(
                title: "Tools",
                onSeeAll: () {},
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              sliver: SliverGrid(
                delegate: SliverChildListDelegate.fixed(
                  const [
                    _ToolCard(icon: Icons.tune, label: "Adjust"),
                    _ToolCard(icon: Icons.auto_awesome, label: "AI Enhance"),
                    _ToolCard(icon: Icons.layers_outlined, label: "Layers"),
                    _ToolCard(icon: Icons.subtitles_outlined, label: "Captions"),
                    _ToolCard(icon: Icons.color_lens_outlined, label: "Color"),
                    _ToolCard(icon: Icons.speed_outlined, label: "Speed"),
                  ],
                ),
                gridDelega: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.03,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onSeeAll;

  const _SectionTitle({
    required this.title,
    required this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),


