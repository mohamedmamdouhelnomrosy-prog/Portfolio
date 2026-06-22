import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  // ─── Dark Theme (Primary) ────────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xFF0f1117),
    surface: Color(0xff161b27),
    card: Color(0xff1c2333),
    secondary: Color(0xff1b9bca),
    secondary50: Color(0xff23c1fb),
    secondary25: Color(0xffc2dde6),
    text1: Color(0xffcbe7fa),
    text2: Color(0xff8b9cbf),
    text3: Color(0xff64748b),
    border: Color(0xff2a3248),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
  );


  // ─── Light Theme ─────────────────────────────────────────────────────────
  static const lightValues = AppColors(
    background: Color(0xfff0f4fa),
    surface: Color(0xffffffff),
    card: Color(0xfffffff4),
    secondary: Color(0xff1b9bca),
    secondary50: Color(0xff23c1fb),
    secondary25: Color(0xffc2dde6),
    text1: Color(0xff053445),
    text2: Color(0xff374151),
    text3: Color(0xffbcbcbc),
    border: Color(0xffe2e8f4),
    success: Color(0xFF00C48C),
    warning: Color(0xFFFFB300),
    danger: Color(0xFFFF4757),
  );

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color card;
  final Color border;
  final Color secondary;
  final Color secondary50;    // ← جديد
  final Color secondary25;    // ← جديد
  final Color success;
  final Color warning;
  final Color danger;
  final Color text1;
  final Color text2;
  final Color text3;

  const AppColors({
    required this.background,
    required this.surface,
    required this.card,
    required this.border,

    required this.secondary,
    required this.secondary50,
    required this.secondary25,
    required this.success,
    required this.warning,
    required this.danger,
    required this.text1,
    required this.text2,
    required this.text3,
  });

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
      card: surfaceElevated ?? this.card,
      border: border ?? this.border,
      secondary: secondary ?? this.secondary,
      secondary50: secondary50 ?? this.secondary50,
      secondary25: secondary25 ?? this.secondary25,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      text1: textPrimary ?? this.text1,
      text2: textSecondary ?? this.text2,
      text3: fontColor3 ?? this.text3,
    );
  }

  // ─── lerp ─────────────────────────────────────────────────────────────────
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
      border: Color.lerp(border, other.border, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondary50: Color.lerp(secondary50, other.secondary50, t)!,
      secondary25: Color.lerp(secondary25, other.secondary25, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      text1: Color.lerp(text1, other.text1, t)!,
      text2: Color.lerp(text2, other.text2, t)!,
      text3: Color.lerp(text3, other.text3, t)!,
    );
  }
}