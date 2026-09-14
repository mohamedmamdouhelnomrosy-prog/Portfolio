import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utilities/extensions.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────
  static TextStyle get mainFont => GoogleFonts.sora();
  static TextStyle get secondaryFont => GoogleFonts.inter();

  static TextStyle secondaryStyle({
    Color? color,
    required double size,
    FontWeight? fontWeight,
  }) =>
      secondaryFont.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      );

  static TextStyle mainStyle({
    Color? color,
    required double size,
    FontWeight? fontWeight,
  }) =>
      mainFont.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      );

  /// -------------------------------------------------- ///
  static TextStyle basicDataTitle(
          {Color? color, required BuildContext context}) =>
      mainStyle(
        size: context.matchedSize(large: 16, medium: 14, small: 14),
        fontWeight: FontWeight.w600,
        color: color,
      );
  static TextStyle basicDataSubTitle(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 18, medium: 14, small: 12),
        fontWeight: FontWeight.w400,
        color: color,
      );

  static TextStyle basicDataLabelName(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 12, medium: 10, small: 10),
        fontWeight: FontWeight.w100,
        color: color,
      );

  static TextStyle basicDataLabelValue(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 14, medium: 12, small: 12),
        fontWeight: FontWeight.w500,
        color: color,
      );
  static TextStyle title({Color? color, required BuildContext context}) =>
      mainStyle(
        size: context.matchedSize(large: 14, medium: 14, small: 12),
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle titleSmall({Color? color, required BuildContext context}) =>
      mainStyle(
        size: context.matchedSize(large: 14, medium: 12, small: 10),
        fontWeight: FontWeight.w600,
        color: color,
      );
  static TextStyle appbarTitle({Color? color, required BuildContext context}) =>
      mainStyle(
        size: context.matchedSize(large: 13, medium: 12, small: 12),
        fontWeight: FontWeight.w400,
        color: color,
      );
  static TextStyle sectionTitle(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 24, medium: 20, small: 16),
        fontWeight: FontWeight.w600,
        color: color,
      );
  static TextStyle titleCardLarge(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 16, medium: 14, small: 12),
        fontWeight: FontWeight.w600,
        color: color,
      );
  static TextStyle titleCardSmall(
          {Color? color, required BuildContext context}) =>
      mainStyle(
        size: context.matchedSize(large: 12, medium: 10, small: 9),
        fontWeight: FontWeight.w300,
        color: color,
      );
  static TextStyle subtitleCard(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 12, small: 10),
        fontWeight: FontWeight.w500,
        color: color,
      );

  static TextStyle label({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 12, medium: 10, small: 9),
        fontWeight: FontWeight.w500,
        color: color,
      );
  static TextStyle buttonTitle({Color? color, required BuildContext context}) =>
      mainStyle(
        size: context.matchedSize(large: 12, medium: 11, small: 10),
        fontWeight: FontWeight.w600,
        color: color,
      );
  static TextStyle summaryBody({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 14, medium: 13, small: 12),
        fontWeight: FontWeight.w400,
        color: color,
      );
  static TextStyle body({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 12, medium: 11, small: 10),
        fontWeight: FontWeight.w400,
        color: color,
      );
  static TextStyle headline({Color? color, required BuildContext context}) =>
      mainStyle(
        size: context.matchedSize(large: 48, medium: 32, small: 24),
        fontWeight: FontWeight.w800,
        color: color,
      );

  static TextStyle summaryNumberLarge(
          {Color? color, required BuildContext context}) =>
      mainStyle(
        size: context.matchedSize(large: 28, medium: 20, small: 18),
        fontWeight: FontWeight.w900,
        color: color,
      );
  static TextStyle summaryNumberMedium(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 11, medium: 11, small: 10),
        fontWeight: FontWeight.w400,
        color: color,
      );
}
