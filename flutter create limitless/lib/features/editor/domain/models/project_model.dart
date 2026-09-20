class ProjectModel {
  final String id;
  final String name;
  final String type; // photo | video | audio | motion
  final DateTime updatedAt;
  final double progress; // 0..1

  const ProjectModel({
    required this.id,
    required this.name,
    required this.type,
    required this.updatedAt,
    required this.progress,
  });
}
