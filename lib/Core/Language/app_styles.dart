import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/Utilities/extensions.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────
  static TextStyle get mainFont => GoogleFonts.spaceGrotesk();
  static TextStyle get secondaryFont => GoogleFonts.ibmPlexSans();
  static TextStyle get thirdFont => GoogleFonts.ibmPlexMono();

  /// ----------- Headers  -----------
  static TextStyle extraBold72({Color? color}) => secondaryFont.copyWith(
        fontSize: 72,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );
  static TextStyle extraBold56({Color? color}) => mainFont.copyWith(
        fontSize: 56,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );
  static TextStyle extraBold48({Color? color}) => mainFont.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );
  static TextStyle extraBold40({Color? color}) => mainFont.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );
  static TextStyle extraBold32({Color? color}) => mainFont.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );
  static TextStyle extraBold28({Color? color}) => mainFont.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );
  static TextStyle extraBold24({Color? color}) => mainFont.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );
  static TextStyle extraBold20({Color? color}) => mainFont.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: color ?? Colors.black,
      );

  /// ----------- Titles -----------
  static TextStyle bold40({Color? color}) => mainFont.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );
  static TextStyle bold32({Color? color}) => mainFont.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );
  static TextStyle bold28({Color? color}) => mainFont.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );
  static TextStyle bold24({Color? color}) => mainFont.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );
  static TextStyle bold20({Color? color}) => mainFont.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );
  static TextStyle bold18({Color? color}) => mainFont.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );
  static TextStyle bold16({Color? color}) => mainFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );
  static TextStyle bold14({Color? color}) => mainFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      );

  /// ----------- Sub Titles -----------
  static TextStyle semiBold28({Color? color}) => mainFont.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.2,
      );

  /// 24px · w600 — Card / panel title
  static TextStyle semiBold24({Color? color}) => mainFont.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.25,
      );

  /// 20px · w600 — Sub-section title
  static TextStyle semiBold20({Color? color}) => mainFont.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.3,
      );

  /// 18px · w500 — Widget / tile title
  static TextStyle semiBold18({Color? color}) => mainFont.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.35,
      );

  /// 16px · w500 — Small heading / label group
  static TextStyle semiBold16({Color? color}) => mainFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.4,
        letterSpacing: 0,
      );

  static TextStyle semiBold14({Color? color}) => mainFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.4,
        letterSpacing: 0,
      );

  static TextStyle semiBold12({Color? color}) => mainFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.4,
        letterSpacing: 0,
      );
  static TextStyle semiBold10({Color? color}) => mainFont.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        height: 1.4,
        letterSpacing: 0,
      );

  /// -------------- labels ---------------------
  static TextStyle regular18({Color? color}) => secondaryFont.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.7,
      );

  static TextStyle regular16({Color? color}) => secondaryFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.65,
      );

  /// 14px · w400 — Secondary body / card descriptions
  static TextStyle regular14({Color? color}) => secondaryFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.6,
      );

  /// 12px · w400 — Captions, helper text
  static TextStyle regular12({Color? color}) => secondaryFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.5,
      );

  /// 10px · w400 — Fine print, timestamps, micro-labels
  static TextStyle regular10({Color? color}) => secondaryFont.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        height: 1.5,
      );

  static TextStyle medium32({Color? color}) => secondaryFont.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );
  static TextStyle medium20({Color? color}) => secondaryFont.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );
  static TextStyle medium18({Color? color}) => secondaryFont.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  static TextStyle medium16({Color? color}) => secondaryFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  static TextStyle medium14({Color? color}) => secondaryFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        letterSpacing: 0.3,
      );

  static TextStyle medium12({Color? color}) => secondaryFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  static TextStyle medium10({Color? color}) => secondaryFont.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle medium8({Color? color}) => secondaryFont.copyWith(
        fontSize: 8,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );
  static TextStyle regular8({Color? color}) => secondaryFont.copyWith(
        fontSize: 8,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        textBaseline: TextBaseline.alphabetic,
      );

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
