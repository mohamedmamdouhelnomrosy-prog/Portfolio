import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio/Features/home/data/models/portfilio_model.dart';
import 'package:portfolio/Features/home/domain/entities/portfilio_entity.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';

import '../../../../Utilities/Constants/enums.dart';

class PortfolioState extends Equatable {
  final PortfolioEntity? data;
  final RequestStatus loading;
  final HomeSection section;
  final ProjectCategory projectCategory;

  const PortfolioState({
    this.data,
    this.loading = RequestStatus.init,
    this.section = HomeSection.about,
    this.projectCategory = ProjectCategory.eCommerce,
  });

  factory PortfolioState.init() => const PortfolioState();

  // ----------------------------
  // Projects
  // ----------------------------

  List<ProjectEntity> get currentProjects {
    final projects = data?.projects ?? const <ProjectEntity>[];

    switch (projectCategory) {
      case ProjectCategory.eCommerce:
        return projects
            .where((project) => project.platform?.name == 'E-commerce')
            .toList(growable: false);

      case ProjectCategory.erp:
        return projects
            .where((project) => project.platform?.name == 'ERP')
            .toList(growable: false);

      case ProjectCategory.finTech:
        return projects
            .where((project) => project.platform?.name == 'FinTech')
            .toList(growable: false);

      case ProjectCategory.other:
        return projects
            .where(
              (project) =>
                  project.platform?.name != 'E-commerce' &&
                  project.platform?.name != 'ERP' &&
                  project.platform?.name != 'FinTech',
            )
            .toList(growable: false);
    }
  }

  // ----------------------------
  // Copy
  // ----------------------------

  PortfolioState copyWith({
    PortfolioEntity? data,
    RequestStatus? loading,
    HomeSection? section,
    ProjectCategory? projectCategory,
  }) {
    return PortfolioState(
      data: data ?? this.data,
      loading: loading ?? this.loading,
      section: section ?? this.section,
      projectCategory: projectCategory ?? this.projectCategory,
    );
  }

  // ----------------------------
  // Equatable
  // ----------------------------

  @override
  List<Object?> get props => [
        data,
        loading,
        section,
        projectCategory,
      ];

  // ----------------------------
  // Hydrated Bloc
  // ----------------------------

  Map<String, dynamic> toJson(PortfolioState state) {
    if (state.data == null) return {};

    return {
      'data': PortfolioModel.toModel(state.data!).toFullJson(),
    };
  }

  static PortfolioState fromJson(Map<String, dynamic> json) {
    try {
      if (json.isEmpty || json['data'] == null) {
        return PortfolioState.init();
      }

      final rawData = json['data'] as Map<String, dynamic>;

      return PortfolioState(
        data: PortfolioModel.fromJson(rawData).fromModel(),
        loading: RequestStatus.init,
        projectCategory: ProjectCategory.eCommerce,
      );
    } catch (e) {
      debugPrint('PortfolioState.fromJson error: $e');

      return PortfolioState.init();
    }
  }
}
