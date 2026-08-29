import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar_item.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/name_widget.dart';

import '../../Features/home/presentation/cubit/cubit.dart';
import '../../Features/home/presentation/cubit/state.dart';
import '../../Utilities/Constants/constants.dart';
import '../../Utilities/Constants/enums.dart';
import '../../Utilities/Constants/global_keys.dart';
import '../../Utilities/Constants/strings.dart';
import '../../Utilities/extensions.dart';
import '../../Utilities/portifilo_icons.dart';
import '../Buttons/theme_button.dart';
import 'menu_button_item.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({
    super.key,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _fadeAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
    _scaleAnim = Tween<double>(begin: 0.95, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

    _ctrl.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() => _isOpen = false);
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_isOpen) {
      _ctrl.reverse();
    } else {
      setState(() => _isOpen = true);
      _ctrl.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none, // ← اتنقل لبره الـ Container
        children: [
          // ── AppBar ──
          Container(
            height: 64,
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: mobileHozPadding),
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: colors.text3, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HamburgerBtn(
                  isOpen: _isOpen,
                  onTap: _toggle,
                ),
                const NameWidget(),
                const ThemeButton(),
              ],
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 64,
            child: FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.surface,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    spacing: 12,
                    children: paths,
                  ),
                ),
              ),
            ),
          ),
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
