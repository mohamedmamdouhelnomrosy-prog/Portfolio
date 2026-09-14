import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xff0F2542),
    surface: Color(0xff0c1b2d),
    accent: Color(0xff6FB6E8),
    accentSoft: Color(0xff02111f),
    secondary: Color(0xffBE8A54),
    secondarySoft: Color(0xff3A2A12),
    text1: Color(0xffF1F5FB),
    text2: Color(0xffBDCEE0),
    text3: Color(0xff8299B4),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
    border: Color(0xff336593),
  );

  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
      background: Color(0xffF4F7FB),
      surface: Color(0xffFFFFFF),
      secondary: Color(0xff8C5C2E),
      secondarySoft: Color(0xffFBF0DE),
      accent: Color(0xff2C74A6),
      accentSoft: Color(0xffE3F0FA),
      text1: Color(0xff0F2542),
      text2: Color(0xff3D5876),
      text3: Color(0xff728AA6),
      success: Color(0xFF00C48C),
      warning: Color(0xFFFFB300),
      danger: Color(0xFFFF4757),
      border: Color(0xffb5bec9));

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
  final Color border;

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
      required this.border,
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
    Color? border,
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
      border: border ?? this.border,
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
      border: Color.lerp(border, other.border, t)!,
      secondarySoft: Color.lerp(secondarySoft, other.secondarySoft, t)!,
    );
  }
}
