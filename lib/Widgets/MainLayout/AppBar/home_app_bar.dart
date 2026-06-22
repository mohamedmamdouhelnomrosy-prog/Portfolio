import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/Constants/constants.dart';
import '../../../Utilities/Constants/enums.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/portifilo_icons.dart';
import 'home_app_bar_item.dart';

class FloatingAppBar extends StatelessWidget {
  const FloatingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = !context.isSmall ? 56.0 : 48.0;
    return Container(
      height: size,
      padding: const EdgeInsetsDirectional.only(start: 24, end: 0),
      margin: const EdgeInsetsDirectional.symmetric(
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: colors.border, width: 0.4),
        boxShadow: [
          BoxShadow(
              color: colors.border,
              blurRadius: 4,
              spreadRadius: 2,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<PortfolioCubit, PortfolioState>(
              buildWhen: (c, p) => c.data?.profile != p.data?.profile,
              builder: (context, state) {
                final profile = state.data?.profile;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (profile?.firstName) == null
                          ? ""
                          : (profile!.firstName!).substring(0, 1),
                      style: AppTextStyles.titleSmall(
                        context: context,
                        color: colors.text2,
                      ),
                    ),
                    CircleAvatar(
                      radius: 2,
                      backgroundColor: colors.secondary,
                    ).paddingOnly(top: 4),
                    Text(
                      (profile?.lastName ?? "").split(" ").last,
                      style: AppTextStyles.titleSmall(
                        context: context,
                        color: colors.text2,
                      ),
                    )
                  ],
                );
              }),
          VertGradintDividerWidget(
            color1: colors.border,
            color2: colors.border,
            height: 20,
            thickness: 2,
          ),
          sectionsWidget(
            section: HomeSection.about,
            icon: Portfolio.summary,
            key: GlobalKeys.aboutMe,
            title: Strings.aboutMe.translate,
          ),
          sectionsWidget(
            section: HomeSection.education,
            icon: Portfolio.education,
            key: GlobalKeys.education,
            title: Strings.education.translate,
          ),
          sectionsWidget(
            section: HomeSection.skills,
            icon: Portfolio.skills,
            key: GlobalKeys.skill,
            title: Strings.mySkill.translate,
          ),
          sectionsWidget(
            section: HomeSection.experience,
            icon: Portfolio.work,
            key: GlobalKeys.experince,
            title: Strings.experience.translate,
          ),
          sectionsWidget(
            section: HomeSection.projects,
            icon: Portfolio.projects,
            key: GlobalKeys.projects,
            title: Strings.projects.translate,
          ),
          sectionsWidget(
            section: HomeSection.certifications,
            icon: Portfolio.certification,
            key: GlobalKeys.certification,
            title: Strings.certification.translate,
          ),
          const ThemeButton()
        ],
      ),
    );
  }

  Widget sectionsWidget({
    required IconData icon,
    required HomeSection section,
    required GlobalKey key,
    required String title,
  }) =>
      BlocBuilder<PortfolioCubit, PortfolioState>(
          buildWhen: (c, p) => c.section != p.section,
          builder: (context, state) {
            return HomeAppBarItem(
              icon: icon,
              onTap: () {
                context.read<PortfolioCubit>().changeSection(
                      section,
                    );
                Scrollable.ensureVisible(
                  key.currentContext!,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              selected: state.section == section,
              title: title,
            );
          });
}
