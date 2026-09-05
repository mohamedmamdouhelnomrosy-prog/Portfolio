import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utilities/extensions.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────
  static TextStyle get mainFont => GoogleFonts.bitter();
  static TextStyle get secondaryFont => GoogleFonts.inter();
  static TextStyle get thirdFont => GoogleFonts.ibmPlexMono();

  /// -------------------------------------------------- ///
  static TextStyle basicDataTitle(
          {Color? color, required BuildContext context}) =>
      mainFont.copyWith(
        fontSize: context.isLarge ? 16 : 14,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle basicDataSubTitle(
          {Color? color, required BuildContext context}) =>
      thirdFont.copyWith(
        fontSize: context.isLarge ? 12 : 11,
        fontWeight: FontWeight.w300,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle basicDataLabelName(
          {Color? color, required BuildContext context}) =>
      thirdFont.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w100,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle basicDataLabelValue(
          {Color? color, required BuildContext context}) =>
      secondaryFont.copyWith(
        fontSize: context.isLarge ? 14 : 12,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle title({Color? color, required BuildContext context}) =>
      mainFont.copyWith(
        fontSize: context.isLarge
            ? 14
            : context.isMedium
                ? 14
                : 12,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle titleSmall({Color? color, required BuildContext context}) =>
      mainFont.copyWith(
        fontSize: context.isLarge ? 14 : 10,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle appbarTitle({Color? color, required BuildContext context}) =>
      mainFont.copyWith(
        fontSize: context.isLarge ? 14 : 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle sectionTitle(
          {Color? color, required BuildContext context}) =>
      secondaryFont.copyWith(
        fontSize: context.isLarge
            ? 24
            : context.isMedium
                ? 20
                : 16,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle titleCardLarge(
          {Color? color, required BuildContext context}) =>
      mainFont.copyWith(
        fontSize: context.isLarge
            ? 16
            : context.isMedium
                ? 14
                : 12,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle titleCardSmall(
          {Color? color, required BuildContext context}) =>
      secondaryFont.copyWith(
        fontSize: context.isLarge
            ? 10
            : context.isMedium
                ? 10
                : 9,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle subtitleCard(
          {Color? color, required BuildContext context}) =>
      secondaryFont.copyWith(
        fontSize: context.isLarge ? 14 : 12,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle label({Color? color, required BuildContext context}) =>
      secondaryFont.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle buttonTitle({Color? color, required BuildContext context}) =>
      mainFont.copyWith(
        fontSize: context.isLarge ? 12 : 10,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle summaryBody({Color? color, required BuildContext context}) =>
      secondaryFont.copyWith(
        fontSize: context.isSmall ? 12 : 14,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.5,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle body({Color? color, required BuildContext context}) =>
      secondaryFont.copyWith(
        fontSize: context.isSmall
            ? 10
            : context.isMedium
                ? 11
                : 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle headline({Color? color, required BuildContext context}) =>
      mainFont.copyWith(
        fontSize: context.isLarge
            ? 48
            : context.isMedium
                ? 32
                : 20,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

  static TextStyle summaryNumberLarge(
          {Color? color, required BuildContext context}) =>
      thirdFont.copyWith(
        fontSize: context.isLarge
            ? 24
            : context.isMedium
                ? 20
                : 18,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle summaryNumberMedium(
          {Color? color, required BuildContext context}) =>
      secondaryFont.copyWith(
        fontSize: context.isLarge
            ? 12
            : context.isMedium
                ? 11
                : 10,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
}
