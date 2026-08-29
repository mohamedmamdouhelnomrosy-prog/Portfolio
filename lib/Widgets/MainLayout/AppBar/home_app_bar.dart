import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/name_widget.dart';

import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/Constants/enums.dart';
import '../../../Utilities/Constants/global_keys.dart';
import '../../../Utilities/Constants/strings.dart';
import '../../../Utilities/portifilo_icons.dart';
import 'home_app_bar_item.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final padding = context.matchedSize(large: 160, medium: 16, small: 0);
    return Container(
      height: 64,
      padding: EdgeInsetsDirectional.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.text3, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (context.isLarge) ...[
            const NameWidget(),
            const Spacer(),
          ],
          ...paths,
          const Spacer(),
          const ThemeButton()
        ],
      ),
    );
  }

  List<Widget> get paths => [
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
      ];
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
