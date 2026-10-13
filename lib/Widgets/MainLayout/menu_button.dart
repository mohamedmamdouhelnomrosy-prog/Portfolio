import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/sections.dart';

import '../../Utilities/Constants/constants.dart';
import '../../Utilities/extensions.dart';
import '../Buttons/theme_button.dart';
import 'menu_button_item.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: colors.surface,
      child: Row(
        spacing: 8,
        children: [
          ...SectionModel.paths.map(
            (e) => SectionsWidget(
              section: e,
            ).expand,
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      height: 64,
      width: double.infinity,
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: mobileHozPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.text3, width: 1),
      ),
      child: AnimationLimiter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 400),
            delay: const Duration(milliseconds: 100),
            childAnimationBuilder: (widget) => SlideAnimation(
              verticalOffset: 24.0,
              child: FadeInAnimation(child: widget),
            ),
            children: [
              HamburgerBtn(
                isOpen: false, // مبقاش محتاجينها تتابع حالة مفتوح/مقفول
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
              const TestThemeToggleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
