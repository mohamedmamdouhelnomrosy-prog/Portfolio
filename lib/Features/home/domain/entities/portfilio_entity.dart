import 'package:equatable/equatable.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';

import 'certificate_entity.dart';
import 'education_entity.dart';
import 'experince_entity.dart';

class PortfolioEntity extends Equatable {
  final ProfileEntity? profile;
  final List<EducationEntity> education;
  final List<ExperienceEntity> experience;
  final List<ProjectEntity> projects;
  final List<CertificateEntity> certificates;
  final List<TechnicalSkillEntity> skills;

  PortfolioEntity({
    this.profile,
    this.education = const [],
    this.projects = const [],
    this.experience = const [],
    this.certificates = const [],
    this.skills = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        profile,
        education,
        projects,
        experience,
        certificates,
        skills,
      ];
}
