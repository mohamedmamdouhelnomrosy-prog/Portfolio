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
  final List<String> responsibilities;

  ExperienceModel(
      {this.id,
      this.profileId,
      this.jobTitle,
      this.companyName,
      this.location,
      this.startDate,
      this.responsibilities = const [],
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
        responsibilities: List<String>.from(json['responsibilities'] ?? []),
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
        "responsibilities": responsibilities,
      };

  static ExperienceModel toModel(ExperienceEntity? entity) => ExperienceModel(
      id: entity?.id,
      profileId: entity?.profileId,
      jobTitle: entity?.jobTitle,
      companyName: entity?.companyName,
      location: entity?.location,
      startDate: entity?.startDate,
      endDate: entity?.endDate,
      responsibilities: entity?.responsibilities ?? [],
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
        responsibilities: responsibilities,
      );
}
