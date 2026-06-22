import 'package:equatable/equatable.dart';

class CertificateEntity extends Equatable {
  final String? id;
  final String? profileId;
  final String? courseName;
  final String? provider;
  final String? issueDate;
  final String? credentialUrl;
  final String? certificateImageUrl;

  const CertificateEntity({
    this.id,
    this.profileId,
    this.courseName,
    this.provider,
    this.issueDate,
    this.credentialUrl,
    this.certificateImageUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        profileId,
        courseName,
        provider,
        issueDate,
        credentialUrl,
        credentialUrl
      ];
}
