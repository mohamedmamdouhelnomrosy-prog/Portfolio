import 'package:equatable/equatable.dart';

class MethodologyEntity extends Equatable {
  final String? id;
  final String? profileId;
  final String? category;
  final String? conceptName;

  const MethodologyEntity({
    this.id,
    this.profileId,
    this.category,
    this.conceptName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, profileId, category, conceptName];
}
