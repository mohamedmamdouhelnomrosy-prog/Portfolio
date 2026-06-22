import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

mixin LayoutHandlerMixin {
  Widget buildLayout(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (ResponsiveBreakpoints.of(context).isDesktop) {
        return buildLargeScreen();
      } else if (ResponsiveBreakpoints.of(context).isTablet) {
        return buildMediumScreen();
      } else {
        return buildSmallScreen();
      }
    });
  }

  Widget buildLargeScreen();

  Widget buildMediumScreen();

  Widget buildSmallScreen();
}
