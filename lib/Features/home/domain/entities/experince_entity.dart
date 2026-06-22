import 'package:equatable/equatable.dart';

class ExperienceEntity extends Equatable {
  final String? id;
  final String? profileId;
  final String? jobTitle;
  final String? companyName;
  final String? location;
  final bool status;
  final DateTime? startDate;
  final DateTime? endDate;
  final List<String> responsibilities;

  ExperienceEntity({
    this.id,
    this.profileId,
    this.jobTitle,
    this.companyName,
    this.location,
    this.startDate,
    this.responsibilities = const [],
    this.status = false, this.endDate,
  });

  List<Object?> get props => [
        id,
        profileId,
        jobTitle,
        companyName,
        location,
        startDate,
        responsibilities,
        status
      ];
}
