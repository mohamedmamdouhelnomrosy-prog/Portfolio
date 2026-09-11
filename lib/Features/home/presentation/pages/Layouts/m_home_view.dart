import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/home_summary_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_me.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../../../../Widgets/Portfilio/divider.dart';
import '../../widgets/certification/certification_widget.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/projects/my_projects.dart';
import '../../widgets/skills/my_skills.dart';

class MediumHomeView extends StatelessWidget {
  const MediumHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// Summary
        const HomeSummarySection(
          hozPadding: tabletHozPadding,
        ),
        SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),

        const EducationSection(
          padding: tabletHozPadding,
        ),
        SliverToBoxAdapter(
          child: mediumSpacing.heightBox,
        ),

        /// Skills
        const SkillsSection(
          hozPadding: tabletHozPadding,
          iconSize: 22,
          countPerRow: 2,
          height: 160,
        ),

        SliverToBoxAdapter(
          child: mediumSpacing.heightBox,
        ),

        /// Experince
        const ExperienceSection(
          padding: tabletHozPadding,
        ),

        SliverToBoxAdapter(child: mediumSpacing.heightBox),

        const MyProjectsWidget(
          hozPadding: tabletHozPadding,
          height: 240,
          countPerRow: 1,
        ),
        SliverToBoxAdapter(
          child: mediumSpacing.heightBox,
        ),

        const CertificationSection(
          hozPadding: tabletHozPadding,
        ),
        SliverToBoxAdapter(child: mediumSpacing.heightBox),
        const SliverToBoxAdapter(child: DividerWidget()),
        SliverToBoxAdapter(child: mediumSpacing.heightBox),
        const SliverToBoxAdapter(child: ContactWidget()),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 16,
        )),
      ],
    );
  }
}
