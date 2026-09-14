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
  final List<ExperienceContentEntity> content;

  ExperienceEntity({
    this.id,
    this.profileId,
    this.jobTitle,
    this.companyName,
    this.location,
    this.startDate,
    this.content = const [],
    this.status = false,
    this.endDate,
  });

  List<Object?> get props => [
        id,
        profileId,
        jobTitle,
        companyName,
        location,
        startDate,
        content,
        status,
        endDate,
      ];
}

class ExperienceContentEntity extends Equatable {
  final String? title;
  final List<String> keys;

  ExperienceContentEntity({
    this.keys = const [],
    this.title,
  });
  List<Object?> get props => [keys, title];
}
