import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final String? id;
  final String? profileId;
  final String? title;
  final String? projectType;
  final ProjectPlatformEntity? platform;
  final List<String> keyTasks;
  final List<ProjectLinkEntity> links;
  final bool isManual;

  ProjectEntity({
    this.id,
    this.profileId,
    this.title,
    this.projectType,
    this.platform,
    this.keyTasks = const [],
    this.links = const [],
    this.isManual = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, profileId, title, projectType, platform, keyTasks, isManual, links];
}

class ProjectPlatformEntity extends Equatable {
  final int? id;
  final String? name;
  final String? color;

  const ProjectPlatformEntity({
    this.id,
    this.name,
    this.color,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, color];
}

class LinkTypeEntity extends Equatable {
  final String? id;
  final String? type;

  const LinkTypeEntity({
    this.id,
    this.type,
  });

  List<Object?> get props => [
        id,
        type,
      ];
}

class ProjectLinkEntity extends Equatable {
  final String? id;
  final String? url;
  final String? name;
  final LinkTypeEntity? linkType;

  const ProjectLinkEntity({
    this.id,
    this.name,
    this.url,
    this.linkType,
  });

  List<Object?> get props => [
        id,
        name,
        url,
        linkType,
      ];
}
