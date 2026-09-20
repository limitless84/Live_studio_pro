import '../../features/editor/domain/models/project_model.dart';
import '../../features/editor/presentation/pages/project_details_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/editor/presentation/pages/editor_home_page.dart';
import '../../features/marketplace/presentation/pages/marketplace_page.dart';
import '../../features/ai_studio/presentation/pages/ai_studio_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/editor',
    routes: [GoRoute(
  path: '/editor/project',
  builder: (context, state) {
    final project = state.extra as ProjectModel;
    return ProjectDetailsPage(project: project);
  },
),

      GoRoute(
        path: '/editor',
        name: 'editor',
        builder: (context, state) => const EditorHomePage(),
      ),
      GoRoute(
        path: '/marketplace',
        name: 'marketplace',
        builder: (context, state) => const MarketplacePage(),
      ),
      GoRoute(
        path: '/ai-studio',
        name: 'ai-studio',
        builder: (context, state) => const AiStudioPage(),
      ),
    ],
  );
});
import '../../features/editor/presentation/pages/editor_photo_page.dart';
import '../../features/editor/presentation/pages/editor_video_page.dart';
import '../../features/editor/presentation/pages/editor_audio_page.dart';
import '../../features/editor/presentation/pages/editor_motion_page.dart';
GoRoute(
  path: '/editor/photo',
  builder: (context, state) => const EditorPhotoPage(),
),
GoRoute(
  path: '/editor/video',
  builder: (context, state) => const EditorVideoPage(),
),
GoRoute(
  path: '/editor/audio',
  builder: (context, state) => const EditorAudioPage(),
),
GoRoute(
  path: '/editor/motion',
  builder: (context, state) => const EditorMotionPage(),
),

