import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';

class ProfileModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? jobTitle;
  final String? email;
  final String? phone;
  final String? location;
  final String? summary;
  final String? github;
  final String? linkedin;
  final String? image;
  final String? cv;
  final    bool militaryService;

  ProfileModel({
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

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      jobTitle: json['job_title'],
      email: json['email'],
      phone: json['phone'],
      location: json['location'],
      summary: json['summary'],
      github: json['github'],
      linkedin: json['linkedin'],
      image: json['image'],
      militaryService: json['military_service'] ?? false,
      cv: json['cv']);

  static ProfileModel toModel(ProfileEntity? entity) => ProfileModel(
      id: entity?.id,
      firstName: entity?.firstName,
      lastName: entity?.lastName,
      jobTitle: entity?.jobTitle,
      email: entity?.email,
      phone: entity?.phone,
      location: entity?.location,
      summary: entity?.summary,
      github: entity?.github,
      linkedin: entity?.linkedin,
      militaryService: entity?.militaryService??true,
      image: entity?.image,
      cv: entity?.cv);
  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        jobTitle: jobTitle,
        email: email,
        phone: phone,
        cv: cv,
        location: location,
        summary: summary,
        github: github,
        linkedin: linkedin,
        image: image,
        militaryService: militaryService,
      );

  Map<String, dynamic> toJson() => {
    "id":id,
    "firstName":firstName,
    "lastName":lastName,
    "jobTitle":jobTitle,
    "email":email,
    "phone":phone,
    "location":location,
    "summary":summary,
    "github":github,
    "linkedin":linkedin,
    "image":image,
    "cv":cv,
    "militaryService":militaryService,
      };
}
