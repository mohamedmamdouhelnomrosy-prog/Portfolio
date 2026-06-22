import 'package:portfolio/Features/home/data/models/profile_model.dart';
import 'package:portfolio/Features/home/data/models/project_model.dart';
import 'package:portfolio/Features/home/data/models/tech_skill_model.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';

import 'certificate_model.dart';
import 'education_model.dart';
import 'experince_model.dart';

class PortfolioModel {
  final ProfileModel? profile;
  final List<EducationModel> education;
  final List<ExperienceModel> experience;
  final List<ProjectModel> projects;
  final List<CertificateModel> certificates;
  final List<TechnicalSkillModel> skills;

  PortfolioModel({
    this.profile,
    this.education = const [],
    this.projects = const [],
    this.experience = const [],
    this.certificates = const [],
    this.skills = const [],
  });

  factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
        profile: json['profile'] == null
            ? null
            : ProfileModel.fromJson(json['profile']),
        education: json['education'] == null
            ? []
            : (json['education'] as List)
                .map((e) => EducationModel.fromJson(e))
                .toList(),
        projects: json['projects'] == null
            ? []
            : (json['projects'] as List)
                .map((e) => ProjectModel.fromJson(e))
                .toList(),
        experience: json['experience'] == null
            ? []
            : (json['experience'] as List)
                .map((e) => ExperienceModel.fromJson(e))
                .toList(),
        certificates: json['certificates'] == null
            ? []
            : (json['certificates'] as List)
                .map((e) => CertificateModel.fromJson(e))
                .toList(),
        skills: json['skills'] == null
            ? []
            : (json['skills'] as List)
                .map((e) => TechnicalSkillModel.fromJson(e))
                .toList(),
      );
  Map<String, dynamic> toFullJson() => {
        'profile': profile?.toJson(),
        'education': education.map((e) => e.toJson()).toList(),
        'experience': experience.map((e) => e.toJson()).toList(),
        'projects': projects.map((e) => e.toJson()).toList(),
        'certificates': certificates.map((e) => e.toJson()).toList(),
        'skills': skills.map((e) => e.toJson()).toList(),

      };

  PortfolioEntity fromModel() => PortfolioEntity(
        profile: profile?.toEntity(),
        education: education.map((e) => e.fromModel()).toList(),
        projects: projects.map((e) => e.fromModel()).toList(),
        experience: experience.map((e) => e.fromModel()).toList(),
        certificates: certificates.map((e) => e.fromModel()).toList(),
        skills: skills.map((e) => e.toEntity()).toList(),
      );

  static PortfolioModel toModel(PortfolioEntity? pr) => PortfolioModel(
        profile: ProfileModel.toModel(pr?.profile),
        education: pr?.education.map((e) => EducationModel.toModel(e)).toList()??[],
        projects: pr?.projects.map((e) => ProjectModel.toModel(e)).toList()??[],
        experience: pr?.experience.map((e) => ExperienceModel.toModel(e)).toList()??[],
        certificates: pr?.certificates.map((e) => CertificateModel.toModel(e)).toList()??[],
        skills: pr?.skills.map((e) => TechnicalSkillModel.toModel(e)).toList()??[],
      );
}
