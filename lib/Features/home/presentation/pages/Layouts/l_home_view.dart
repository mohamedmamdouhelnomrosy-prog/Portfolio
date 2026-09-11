import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/home_summary_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact_me.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../../widgets/certification/certification_widget.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/projects/my_projects.dart';
import '../../widgets/skills/my_skills.dart';

class LargeHomeView extends StatelessWidget {
  const LargeHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// Summary

        const HomeSummarySection(
          hozPadding: desktopHozPadding,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        const EducationSection(
          padding: desktopHozPadding,
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        /// Skills
        const SkillsSection(
          iconSize: 22,
          countPerRow: 3,
          height: 144,
        ),

        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        /// Experince
        const ExperienceSection(
          padding: desktopHozPadding,
        ),

        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        const MyProjectsWidget(
          hozPadding: desktopHozPadding,
          height: 300,
          countPerRow: 2,
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        const CertificationSection(
          hozPadding: desktopHozPadding,
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),
        const SliverToBoxAdapter(child: DividerWidget()),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),
        const SliverToBoxAdapter(child: ContactWidget()),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 16,
        )),
      ],
    );
  }
}
