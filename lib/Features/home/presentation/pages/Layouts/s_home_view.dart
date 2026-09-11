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

class SmallHomeView extends StatelessWidget {
  const SmallHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// Summary
        const HomeSummarySection(
          hozPadding: mobileHozPadding,
          size: 72,
        ),
        SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),

        const EducationSection(
          padding: mobileHozPadding,
        ),

        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),

        /// Skills
        const SkillsSection(
          hozPadding: mobileHozPadding,
          iconSize: 20,
          countPerRow: 1,
          height: 140,
        ),

        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),

        /// Experince
        const ExperienceSection(
          padding: mobileHozPadding,
        ),
        SliverToBoxAdapter(child: smallSpacing.heightBox),

        const MyProjectsWidget(
          hozPadding: mobileHozPadding,
          countPerRow: 1,
          height: 300,
        ),

        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),

        const CertificationSection(
          hozPadding: mobileHozPadding,
        ),
        SliverToBoxAdapter(child: smallSpacing.heightBox),
        const SliverToBoxAdapter(child: DividerWidget()),
        SliverToBoxAdapter(child: smallSpacing.heightBox),
        const SliverToBoxAdapter(child: ContactWidget()),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 16,
        )),
      ],
    );
  }
}
