import 'package:portfolio/Features/home/domain/entities/project_entity.dart';

class ProjectModel {
  final String? id;
  final String? profileId;
  final String? title;
  final String? projectType;
  final ProjectPlatformModel? platform;
  final List<String> keyTasks;
  final bool isManual;

  ProjectModel({
    this.id,
    this.profileId,
    this.title,
    this.projectType,
    this.platform,
    this.keyTasks = const [],
    this.isManual = false,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id']?.toString(),
      profileId: json['profile_id'],
      title: json['title'],
      projectType: json['project_type'],
      platform: json['platform'] == null ? null : ProjectPlatformModel.fromJson(json["platform"]),
      keyTasks: List<String>.from(json['key_tasks'] ?? []),
      isManual: json['manual'] ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
    "id":id,
    "profileId":profileId,
    "title":title,
    "projectType":projectType,
    "platform":platform,
    "keyTasks":keyTasks,
    "isManual":isManual,
      };

  static ProjectModel toModel(ProjectEntity? entity) => ProjectModel(
        id:entity?. id,
        profileId:entity?. profileId,
        title:entity?. title,
        projectType:entity?. projectType,
        platform:ProjectPlatformModel.toModel(entity?.platform),
        keyTasks:entity?. keyTasks??[],
        isManual:entity?. isManual??false,
      );
  ProjectEntity fromModel() => ProjectEntity(
        id: id,
        profileId: profileId,
        title: title,
        projectType: projectType,
        platform: platform?.fromModel(),
        keyTasks: keyTasks,
        isManual: isManual,
      );
}


class ProjectPlatformModel  {
  final int? id;
  final String? name;
  final String? color;

  const ProjectPlatformModel({
    this.id, this.name, this.color,
  });

  factory ProjectPlatformModel.fromJson(Map<String, dynamic> json) => ProjectPlatformModel(
    id: json['id'],
    name: json['name'],
    color: json['color'],
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "name":name,
    "color":color,
  };

  static ProjectPlatformModel toModel(ProjectPlatformEntity? entity) => ProjectPlatformModel(
    id:entity?. id,
   color: entity?.color,
    name: entity?.name
  );
  ProjectPlatformEntity fromModel() => ProjectPlatformEntity(
    id: id,
    color: color,
    name: name,
  );



}
