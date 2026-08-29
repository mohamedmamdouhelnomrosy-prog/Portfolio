import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xFF0F1417),
    surface: Color(0xff181F23),
    accent: Color(0xff3DCB86),
    accentSoft: Color(0xff123324),
    secondary: Color(0xffF0A94A),
    secondarySoft: Color(0xff3A2A12),
    text1: Color(0xffEDF1EF),
    text2: Color(0xff8A9298),
    text3: Color(0xff2A3338),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
  );

  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xffF2F5F3),
    surface: Color(0xffffffff),
    accent: Color(0xff1E8E5A),
    accentSoft: Color(0xffE6F4EC),
    secondary: Color(0xffD98F2B),
    secondarySoft: Color(0xffFBF0DE),
    text1: Color(0xff12181D),
    text2: Color(0xff5B6570),
    text3: Color(0xffDCE3E1),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color accent;
  final Color accentSoft; // ← جديد
  final Color secondary; // ← جديد
  final Color secondarySoft; // ← جديد
  final Color success;
  final Color warning;
  final Color danger;
  final Color text1;
  final Color text2;
  final Color text3;

  const AppColors(
      {required this.background,
      required this.surface,
      required this.accent,
      required this.accentSoft,
      required this.secondary,
      required this.success,
      required this.warning,
      required this.danger,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.secondarySoft});

  // ─── Gradient Helpers ─────────────────────────────────────────────────────
  static const gradientCardDark = LinearGradient(
    colors: [Color(0xFF050812), Color(0xFF1a1f3a), Color(0xFF0a0e27)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const gradientCardLight = LinearGradient(
    colors: [Color(0xFFF6F5F5), Color(0xFFEDF1FB), Color(0xFFEDF1FB)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ─── copyWith ─────────────────────────────────────────────────────────────
  @override
  AppColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceElevated,
    Color? border,
    Color? secondary,
    Color? secondarySoft,
    Color? secondary50,
    Color? secondary25,
    Color? success,
    Color? warning,
    Color? danger,
    Color? textPrimary,
    Color? textSecondary,
    Color? fontColor3,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      accent: secondary ?? this.accent,
      accentSoft: secondary50 ?? this.accentSoft,
      secondary: secondary25 ?? this.secondary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      text1: textPrimary ?? this.text1,
      text2: textSecondary ?? this.text2,
      text3: fontColor3 ?? this.text3,
      secondarySoft: secondarySoft ?? this.secondarySoft,
    );
  }

  // ─── lerp ─────────────────────────────────────────────────────────────────
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      text1: Color.lerp(text1, other.text1, t)!,
      text2: Color.lerp(text2, other.text2, t)!,
      text3: Color.lerp(text3, other.text3, t)!,
      secondarySoft: Color.lerp(secondarySoft, other.secondarySoft, t)!,
    );
  }
}
