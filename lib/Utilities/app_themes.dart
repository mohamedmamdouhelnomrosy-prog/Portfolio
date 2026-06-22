import 'package:flutter/material.dart';

import '../Core/Theme/theme_colors.dart';

class AppThemes {
  static ThemeData createTheme({required bool isArabic, required bool isDark}) {
    final colorExt = isDark ? AppColors.darkValues : AppColors.lightValues;

    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: colorExt.background,
      useMaterial3: true,
      extensions: [colorExt],
    );
  }
}
