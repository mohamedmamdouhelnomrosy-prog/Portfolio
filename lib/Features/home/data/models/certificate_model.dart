import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';

class CertificateModel {
  final String? id;
  final String? profileId;
  final String? courseName;
  final String? provider;
  final String? issueDate;
  final String? certificateImageUrl;
  final String? credentialUrl;

  CertificateModel({
    this.id,
    this.profileId,
    this.courseName,
    this.provider,
    this.issueDate,
    this.credentialUrl,
    this.certificateImageUrl,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id']?.toString(),
      profileId: json['profile_id'] ,
      courseName: json['course_name'] ,
      provider: json['provider'] ,
      issueDate: json['issue_date'] ,
      credentialUrl: json['credential_url'] ,
      certificateImageUrl: json['certificate_image_url'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id":id,
      "profileId":profileId,
      "courseName":courseName,
      "provider":provider,
      "issueDate":issueDate,
      "credentialUrl":credentialUrl,
      "certificateImageUrl":certificateImageUrl,
    };
  }

  CertificateEntity fromModel() => CertificateEntity(
      id: id,
      profileId: profileId,
      courseName: courseName,
      provider: provider,
      issueDate: issueDate,
      credentialUrl: credentialUrl,
      certificateImageUrl: certificateImageUrl);
  static CertificateModel toModel(CertificateEntity? entity) => CertificateModel(
        id: entity?. id,
        profileId: entity?. profileId,
        certificateImageUrl: entity?. certificateImageUrl,
        courseName: entity?. courseName,
        provider: entity?. provider,
        issueDate: entity?. issueDate,
        credentialUrl: entity?. credentialUrl,
      );
}
