import '../domain/models/project_model.dart';

final mockProjects = <ProjectModel>[
  ProjectModel(
    id: 'p1',
    name: 'Travel Reel',
    type: 'video',
    updatedAt: DateTime.now().subtract(const Duration(hours: 5)),
    progress: 0.72,
  ),
  ProjectModel(
    id: 'p2',
    name: 'Podcast Intro',
    type: 'audio',
    updatedAt: DateTime.now().subtract(const Duration(days: 1)),
    progress: 0.45,
  ),
  ProjectModel(
    id: 'p3',
    name: 'Product Poster',
    type: 'photo',
    updatedAt: DateTime.now().subtract(const Duration(days: 2)),
    progress: 0.90,
  ),
];
