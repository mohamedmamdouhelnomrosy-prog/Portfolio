import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';

class ExperienceModel {
  final String? id;
  final String? profileId;
  final String? jobTitle;
  final String? companyName;
  final String? location;
  final bool status;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<ExperienceContentModel> content;

  ExperienceModel(
      {this.id,
      this.profileId,
      this.jobTitle,
      this.companyName,
      this.location,
      this.startDate,
      this.content = const [],
      this.status = false,
      this.endDate});

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        id: json['id']?.toString(),
        profileId: json['profile_id'],
        jobTitle: json['job_title'],
        companyName: json['company_name'],
        location: json['location'],
        startDate: json['startDate'] == null
            ? null
            : DateTime.tryParse(json['startDate']),
        endDate: json['end_date'] == null
            ? null
            : DateTime.tryParse(json['end_date']),
        status: json['status'] ?? false,
        content: json['content'] == null
            ? []
            : (json['content'] as List)
                .map((e) => ExperienceContentModel.fromJson(e))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profileId": profileId,
        "jobTitle": jobTitle,
        "companyName": companyName,
        "location": location,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "status": status,
        'content': content.map((e) => e.toJson()).toList(),
      };

  static ExperienceModel toModel(ExperienceEntity? entity) => ExperienceModel(
      id: entity?.id,
      profileId: entity?.profileId,
      jobTitle: entity?.jobTitle,
      companyName: entity?.companyName,
      location: entity?.location,
      startDate: entity?.startDate,
      endDate: entity?.endDate,
      content: entity?.content
              .map((e) => ExperienceContentModel.toModel(e))
              .toList() ??
          [],
      status: entity?.status ?? false);
  ExperienceEntity fromModel() => ExperienceEntity(
        id: id,
        profileId: profileId,
        jobTitle: jobTitle,
        companyName: companyName,
        location: location,
        startDate: startDate,
        endDate: endDate,
        status: status,
        content: content.map((e) => e.fromModel()).toList(),
      );
}

class ExperienceContentModel {
  final String? title;
  final List<String> keys;

  ExperienceContentModel({
    this.keys = const [],
    this.title,
  });

  factory ExperienceContentModel.fromJson(Map<String, dynamic> json) =>
      ExperienceContentModel(
        title: json['title'],
        keys: List<String>.from(json['keys'] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "keys": keys,
      };

  static ExperienceContentModel toModel(ExperienceContentEntity? entity) =>
      ExperienceContentModel(
        title: entity?.title,
        keys: entity?.keys ?? [],
      );
  ExperienceContentEntity fromModel() => ExperienceContentEntity(
        title: title,
        keys: keys,
      );
}
