import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_me.dart';
import 'package:portfolio/Features/home/presentation/widgets/hero/hero_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/summery_widget.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

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
          size: 120,
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        const SummarySection(
          hozPadding: tabletHozPadding,
        ),
        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        /// Experince
        const ExperienceSection(
          padding: tabletHozPadding,
        ),
        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        /// Skills
        const SkillsSection(
          iconSize: 22,
          height: 140,
          hozPadding: tabletHozPadding,
        ),
        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),
        const MyProjectsWidget(
          hozPadding: tabletHozPadding,
          height: 260,
          countPerRow: 1,
        ),
        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),
        const EducationSection(
          padding: tabletHozPadding,
        ),
        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        const CertificationSection(
          hozPadding: tabletHozPadding,
          perRow: 2,
        ),
        SliverToBoxAdapter(
          child: smallSpacing.heightBox,
        ),
        const SliverToBoxAdapter(
          child: DividerWidget(),
        ),
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
