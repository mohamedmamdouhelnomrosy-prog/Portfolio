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

class SmallHomeView extends StatelessWidget {
  const SmallHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// Summary
        const HomeSummarySection(
          hozPadding: mobileHozPadding,
          size: 100,
        ),
        SliverToBoxAdapter(
          child: largeSpacing.heightBox,
        ),

        const SummarySection(
          hozPadding: mobileHozPadding,
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
          padding: mobileHozPadding,
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
          countPerRow: 1,
          height: 100,
          hozPadding: mobileHozPadding,
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
          hozPadding: mobileHozPadding,
          height: 270,
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
          padding: mobileHozPadding,
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
          hozPadding: mobileHozPadding,
          perRow: 1,
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
