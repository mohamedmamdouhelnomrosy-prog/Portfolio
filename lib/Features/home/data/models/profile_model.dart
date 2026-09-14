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
  final String? currentCompany;
  final bool militaryService;
  final double? experience;
  final String? shortSummary;
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
    this.experience,
    this.currentCompany,
    this.cv,
    this.shortSummary,
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
      currentCompany: json['currentCompany'],
      image: json['image'],
      militaryService: json['military_service'] ?? false,
      experience: json['experience'],
      shortSummary: json['shortSummary'],
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
      shortSummary: entity?.shortSummary,
      experience: entity?.experience,
      militaryService: entity?.militaryService ?? true,
      image: entity?.image,
      currentCompany: entity?.currentCompany,
      cv: entity?.cv);
  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        jobTitle: jobTitle,
        email: email,
        phone: phone,
        cv: cv,
        shortSummary: shortSummary,
        experience: experience,
        currentCompany: currentCompany,
        location: location,
        summary: summary,
        github: github,
        linkedin: linkedin,
        image: image,
        militaryService: militaryService,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "jobTitle": jobTitle,
        "email": email,
        "phone": phone,
        "location": location,
        "shortSummary": shortSummary,
        "summary": summary,
        "github": github,
        "linkedin": linkedin,
        "image": image,
        "cv": cv,
        "currentCompany": currentCompany,
        "militaryService": militaryService,
        "experience": experience,
      };
}
