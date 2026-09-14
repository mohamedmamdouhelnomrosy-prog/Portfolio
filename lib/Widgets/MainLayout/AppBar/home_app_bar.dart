import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/theme_button.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/sections.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final padding = context.matchedSize(
        large: desktopHozPadding,
        medium: tabletHozPadding,
        small: mobileHozPadding);
    return Container(
      height: 64,
      padding: EdgeInsetsDirectional.symmetric(horizontal: padding),
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
              Row(
                spacing: 16,
                children: SectionModel.paths
                    .map((e) => SectionsWidget(section: e))
                    .toList(),
              ),
              const TestThemeToggleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
