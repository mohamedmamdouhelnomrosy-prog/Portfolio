import 'package:equatable/equatable.dart';

class EducationEntity extends Equatable {
  final String? id;
  final String? profileId;
  final String? degree;
  final String? university;
  final String? grade;
  final String? duration;
  final String? gradProjectTitle;
  final List<String> gradProjectTech;

  EducationEntity({
    this.id,
    this.profileId,
    this.degree,
    this.university,
    this.grade,
    this.duration,
    this.gradProjectTitle,
    this.gradProjectTech = const [],
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        profileId,
        degree,
        university,
        grade,
        duration,
        gradProjectTitle,
        gradProjectTech,
      ];
}
