import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio/Features/home/data/models/portfilio_model.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';

import '../../../../Utilities/Constants/enums.dart';

class PortfolioState extends Equatable {
  final PortfolioEntity? data;
  final RequestStatus loading;
  final HomeSection section;
   int get projectLen => data?.projects.length??0;
   int get certificationLen => data?.certificates.length??0;


  const PortfolioState({this.data, this.loading = RequestStatus.init , this.section =HomeSection.about});

  factory PortfolioState.init() => const PortfolioState();

  PortfolioState copyWith({PortfolioEntity? data, RequestStatus? loading , HomeSection? section}) =>
      PortfolioState(data: data ?? this.data, loading: loading ?? this.loading , section: section??this.section);

  @override
  List<Object?> get props => [data, loading,certificationLen,projectLen,section];

 // ✅ fix toJson
  Map<String, dynamic> toJson(PortfolioState state) {
    if (state.data == null) return {};
    return {
      'data': PortfolioModel.toModel(state.data).toFullJson(),
    };
  }

// ✅ fix fromJson
  static PortfolioState fromJson(Map<String, dynamic> json) {
    try {
      if (json.isEmpty || json['data'] == null) return PortfolioState.init();

      final rawData = json['data'] as Map<String, dynamic>;
      return PortfolioState(
        data: PortfolioModel.fromJson(rawData).fromModel(),
        loading: RequestStatus.init,
      );
    } catch (e) {
      debugPrint("fromJson error: $e");
      return PortfolioState.init();
    }
  }
}
