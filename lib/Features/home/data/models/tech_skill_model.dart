import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';

class TechnicalSkillModel {
  final String? category;
  final int? id;
  final List<SkillModel> skills;

  TechnicalSkillModel({
    this.category,
    this.skills = const [],
    this.id,
  });

  factory TechnicalSkillModel.fromJson(Map<String, dynamic> json) =>
      TechnicalSkillModel(
        category: json['category'],
        skills: json['skills'] == null
            ? []
            : (json['skills'] as List)
                .map((e) => SkillModel.fromJson(e))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        'category': category,
        'skills': skills.map((e)=>e.toJson()).toList(),
      };

  static TechnicalSkillModel toModel(TechnicalSkillEntity? s) => TechnicalSkillModel(
        category:s?. category,
        skills:s?. skills.map((e)=>SkillModel.toModel(e)).toList()??[],
        id:s?.id
      );
  TechnicalSkillEntity toEntity() => TechnicalSkillEntity(
        category: category,
                   id: id,
        skills: skills.map((e) => e.toEntity()).toList(),
      );
}

class SkillModel {
  final String? id;
  final String? profileId;
  final String? category;
  final String? skillName;

  SkillModel({
    this.id,
    this.profileId,
    this.category,
    this.skillName,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        id: json['id']?.toString(),
        profileId: json['profile_id'],
        category: json['category'],
        skillName: json["name"] == null ? null : json['name'],
      );

  Map<String, dynamic> toJson() => {
    "id":id,
    "profileId":profileId,
    "category":category,
    "skillName":skillName,
      };

  static SkillModel toModel(SkillEntity? s) => SkillModel(
        id:s?. id,
        profileId:s?. profileId,
        category:s?. category,
        skillName:s?. skillName,
      );
  SkillEntity toEntity() => SkillEntity(
        id: id,
        profileId: profileId,
        category: category,
        skillName: skillName,
      );
}
