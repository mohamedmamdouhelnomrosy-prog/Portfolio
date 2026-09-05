import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class PortfolioAnimationConfig {
  static Duration duration(BuildContext context) {
    return context.isLarge
        ? const Duration(seconds: 1)
        : const Duration(milliseconds: 500);
  }

  static int stagger(BuildContext context) {
    return context.isLarge ? 300 : 100;
  }
}
