import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? id;
  final String? image;
  final String? firstName;
  final String? lastName;
  final String? jobTitle;
  final String? email;
  final String? cv;
  final String? phone;
  final String? location;
  final String? summary;
  final String? github;
  final String? linkedin;
  final bool militaryService;

  ProfileEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.jobTitle,
    this.email,
    this.phone,
    this.location,
    this.summary,
    this.github,
    this.linkedin,
    this.militaryService = false,
    this.image,
    this.cv,
  });

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        jobTitle,
        email,
        phone,
        location,
        summary,
        github,
        linkedin,
        militaryService,
        cv,
        image,
      ];
}
