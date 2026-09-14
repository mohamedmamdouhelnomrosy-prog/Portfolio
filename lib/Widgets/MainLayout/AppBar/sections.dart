import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/Constants/strings.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar_item.dart';

class SectionsWidget extends StatelessWidget {
  final SectionModel section;
  const SectionsWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PortfolioCubit, PortfolioState, HomeSection>(
        selector: (c) => c.section,
        builder: (context, activeSection) {
          return HomeAppBarItem(
            icon: section?.icon,
            onTap: () {
              if (section.section == null) return;
              if (section.key == null) return;
              context.read<PortfolioCubit>().changeSection(
                    section.section!,
                  );
              Scrollable.ensureVisible(
                section.key!.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            selected: activeSection == section.section,
            title: section.title,
          );
        });
  }
}

class SectionModel {
  final HomeSection? section;
  final IconData? icon;
  final GlobalKey? key;
  final String? title;
  const SectionModel({
    this.section,
    this.icon,
    this.key,
    this.title,
  });

  static List<SectionModel> get paths => [
        SectionModel(
          section: HomeSection.about,
          icon: Portfolio.summary,
          key: GlobalKeys.aboutMe,
          title: Strings.aboutMe,
        ),
        SectionModel(
          section: HomeSection.experience,
          icon: Portfolio.work,
          key: GlobalKeys.experince,
          title: Strings.experience,
        ),
        SectionModel(
          section: HomeSection.skills,
          icon: Portfolio.skills,
          key: GlobalKeys.skill,
          title: Strings.mySkill,
        ),
        SectionModel(
          section: HomeSection.projects,
          icon: Portfolio.projects,
          key: GlobalKeys.projects,
          title: Strings.projects,
        ),
        SectionModel(
          section: HomeSection.education,
          icon: Portfolio.education,
          key: GlobalKeys.education,
          title: Strings.education,
        ),
        SectionModel(
          section: HomeSection.certifications,
          icon: Portfolio.certification,
          key: GlobalKeys.certification,
          title: Strings.certification,
        ),
      ];
}
