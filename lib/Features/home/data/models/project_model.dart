import 'package:portfolio/Features/home/domain/entities/project_entity.dart';

class ProjectModel {
  final String? id;
  final String? profileId;
  final String? title;
  final String? projectType;
  final ProjectPlatformModel? platform;
  final List<String> keyTasks;
  final bool isManual;
  final List<ProjectLinkModel> links;

  ProjectModel({
    this.id,
    this.profileId,
    this.title,
    this.projectType,
    this.platform,
    this.keyTasks = const [],
    this.links = const [],
    this.isManual = false,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id']?.toString(),
      profileId: json['profile_id'],
      title: json['title'],
      projectType: json['project_type'],
      platform: json['platform'] == null
          ? null
          : ProjectPlatformModel.fromJson(json["platform"]),
      links: json['links'] == null
          ? []
          : List<ProjectLinkModel>.from(
              json['links'].map((x) => ProjectLinkModel.fromJson(x))),
      keyTasks: List<String>.from(json['key_tasks'] ?? []),
      isManual: json['manual'] ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "profileId": profileId,
        "title": title,
        "projectType": projectType,
        "platform": platform,
        "keyTasks": keyTasks,
        "isManual": isManual,
        "links": links?.map((x) => x.toJson()).toList(),
      };

  static ProjectModel toModel(ProjectEntity? entity) => ProjectModel(
        id: entity?.id,
        profileId: entity?.profileId,
        title: entity?.title,
        projectType: entity?.projectType,
        platform: ProjectPlatformModel.toModel(entity?.platform),
        keyTasks: entity?.keyTasks ?? [],
        isManual: entity?.isManual ?? false,
        links: entity?.links.map((e) => ProjectLinkModel.toModel(e)).toList() ??
            [],
      );
  ProjectEntity fromModel() => ProjectEntity(
        id: id,
        profileId: profileId,
        title: title,
        projectType: projectType,
        platform: platform?.fromModel(),
        keyTasks: keyTasks,
        isManual: isManual,
        links: links?.map((e) => e.fromModel()).toList() ?? [],
      );
}

class ProjectPlatformModel {
  final int? id;
  final String? name;
  final String? color;

  const ProjectPlatformModel({
    this.id,
    this.name,
    this.color,
  });

  factory ProjectPlatformModel.fromJson(Map<String, dynamic> json) =>
      ProjectPlatformModel(
        id: json['id'],
        name: json['name'],
        color: json['color'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
      };

  static ProjectPlatformModel toModel(ProjectPlatformEntity? entity) =>
      ProjectPlatformModel(
          id: entity?.id, color: entity?.color, name: entity?.name);
  ProjectPlatformEntity fromModel() => ProjectPlatformEntity(
        id: id,
        color: color,
        name: name,
      );
}

// ============================================================
// LinkType
// ============================================================

class LinkTypeModel {
  final String? id;
  final String? type;

  const LinkTypeModel({
    this.id,
    this.type,
  });

  factory LinkTypeModel.fromJson(Map<String, dynamic> json) => LinkTypeModel(
        id: json['id'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
      };

  static LinkTypeModel toModel(LinkTypeEntity? entity) =>
      LinkTypeModel(id: entity?.id, type: entity?.type);

  LinkTypeEntity fromModel() => LinkTypeEntity(
        id: id,
        type: type,
      );
}

class ProjectLinkModel {
  final String? id;
  final String? url;
  final String? name;
  final LinkTypeModel? linkType;

  const ProjectLinkModel({
    this.id,
    this.url,
    this.name,
    this.linkType,
  });

  factory ProjectLinkModel.fromJson(Map<String, dynamic> json) =>
      ProjectLinkModel(
        id: json['id'],
        url: json['url'],
        name: json['name'],
        linkType: json['link_type'] == null
            ? null
            : LinkTypeModel.fromJson(json['link_type']),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "link_type": linkType?.toJson(),
      };

  static ProjectLinkModel toModel(ProjectLinkEntity? entity) =>
      ProjectLinkModel(
        id: entity?.id,
        url: entity?.url,
        name: entity?.name,
        linkType: LinkTypeModel.toModel(entity?.linkType),
      );

  ProjectLinkEntity fromModel() => ProjectLinkEntity(
        id: id,
        url: url,
        name: name,
        linkType: linkType?.fromModel(),
      );
}
