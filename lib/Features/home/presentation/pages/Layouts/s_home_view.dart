import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/home_summary_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact_me.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/screen_layout_widget.dart';

import '../../../../../Widgets/Portfilio/divider.dart';
import '../../widgets/certification/certification_widget.dart';
import '../../widgets/education/education_widget.dart';
import '../../widgets/experince/experince_card_widget.dart';
import '../../widgets/general/spacer_widget.dart';
import '../../widgets/products/my_projects.dart';
import '../../widgets/skills/my_skills.dart';

class SmallHomeView extends StatelessWidget {
  const SmallHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        /// Summary
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.profile != p.data?.profile,
                builder: (context, state) {
                  return HomeSummarySection(
                    height: 424,
                    profile: state.data?.profile,
                    certNumber: state.data?.certificates.length ?? 0,
                    projectsNumber: state.data?.projects.length ?? 0,
                    hozPadding: mobileHozPadding,
                    size: 72,
                  );
                })),
        SliverToBoxAdapter(
          child: 16.0.heightBox,
        ),


        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.education != p.data?.education,
              builder: (context, state) {
                return EducationSection(
                  padding: mobileHozPadding,
                    education: state.data?.education ?? []);
              }),
        ),
        const SliverToBoxAdapter(
          child: SpacerWidget(),
        ),

        /// Skills
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.skills != p.data?.skills,
                builder: (context, state) {
                  return SkillsSection(
                    hozPadding: mobileHozPadding,
                    skills: state.data?.skills ?? [],
                    iconSize: 20,
                    countPerRow: 1,
                    height: 100,

                  );
                })),

        const SliverToBoxAdapter(
          child: SpacerWidget(),
        ),

        /// Experince
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) => c.data?.experience != p.data?.experience,
                builder: (context, state) {
                  return ExperienceSection(
                    experiences: state.data?.experience ?? [],
                    hozPadding: mobileHozPadding,
                  );
                })),
        const SliverToBoxAdapter(child: SpacerWidget()),

        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.projects != p.data?.projects,
              builder: (context, state) {
                return MyProjectsWidget(
                  projects: state.data?.projects ?? [],
                  hozPadding: mobileHozPadding,
                  countPerRow: 1,
                  height: 208,

                );
              }),
        ),


        const SliverToBoxAdapter(
          child: SpacerWidget(),
        ),

        SliverToBoxAdapter(
          child: BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.certificates != p.data?.certificates,
              builder: (context, state) {
                return CertificationSection(
                    hozPadding: mobileHozPadding,

                    data: state.data?.certificates ?? []);
              }),
        ),
        const SliverToBoxAdapter(child: SpacerWidget()),
        const SliverToBoxAdapter(child: DividerWidget()),
        const SliverToBoxAdapter(child: SpacerWidget()),
        const SliverToBoxAdapter(child: ContactWidget()),
        const SliverToBoxAdapter(child: SizedBox(height: 16,)),

      ],
    );
  }
}
