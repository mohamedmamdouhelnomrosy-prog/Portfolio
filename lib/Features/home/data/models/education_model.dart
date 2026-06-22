import 'package:portfolio/Features/home/domain/entities/education_entity.dart';

class EducationModel {
  final String? id;
  final String? profileId;
  final String? degree;
  final String? university;
  final String? grade;
  final String? duration;
  final String? gradProjectTitle;
  final List<String> gradProjectTech;

  EducationModel({
    this.id,
    this.profileId,
    this.degree,
    this.university,
    this.grade,
    this.duration,
    this.gradProjectTitle,
    this.gradProjectTech = const [],
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) => EducationModel(
        id: json['id']?.toString(),
        profileId: json['profile_id'],
        degree: json['degree'],
        university: json['university'],
        grade: json['grade'],
        duration: json['duration'],
        gradProjectTitle: json['graduation_project_title'],
        gradProjectTech: List<String>.from(json['graduation_project_tech'] ?? []),
      );

  Map<String, dynamic> toJson() => {
    "id":id,
    "profileId":profileId,
    "degree":degree,
    "university":university,
    "grade":grade,
    "duration":duration,
    "gradProjectTitle":gradProjectTitle,
    "gradProjectTech":gradProjectTech,
      };

  EducationEntity fromModel() => EducationEntity(
        id: id,
        profileId: profileId,
        degree: degree,
        university: university,
        grade: grade,
        duration: duration,
        gradProjectTitle: gradProjectTitle,
        gradProjectTech: gradProjectTech,
      );

  static EducationModel toModel(EducationEntity? entity) => EducationModel(
        id:entity?. id,
        profileId:entity?. profileId,
        degree:entity?. degree,
        university:entity?. university,
        grade:entity?. grade,
        duration:entity?. duration,
        gradProjectTitle:entity?. gradProjectTitle,
        gradProjectTech:entity?. gradProjectTech??[],
      );
}
