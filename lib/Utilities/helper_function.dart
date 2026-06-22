import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Core/Language/app_styles.dart';

abstract class HelperFunctions {
  static void showBottomSheet(BuildContext context,
      {required Widget widget,
      Color? backgroundColor,
      bool isFullScreen = true}) {
    final colors = context.colors;
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: isFullScreen,
        backgroundColor: backgroundColor ?? colors.secondary,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              backgroundColor: backgroundColor ?? colors.secondary,
              builder: (context) {
                return widget;
              });
        });
  }

  static void showDialogHelper(BuildContext context,
      {required Widget contentWidget,
      Color? backgroundColor,
      AlignmentDirectional? alignment,
      final bool enablePadding = true,
      bool isFullScreen = true}) {
    final colors = context.colors;

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
              alignment: alignment,
              shadowColor: colors.text1.withOpacity(0.25),
              backgroundColor: backgroundColor ?? colors.background,
              contentPadding: enablePadding
                  ? const EdgeInsets.symmetric(horizontal: 24, vertical: 40.0)
                  : EdgeInsets.zero,
              content: contentWidget,
            ));
  }

  static void showCustomToast(
    BuildContext context, {
    String? message,
    ContentType? type,
  }) {
    final colors = context.colors;

    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(200.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: message ?? "",
        titleTextStyle: AppTextStyles.semiBold28().copyWith(
          color: Colors.white,
        ),
        message: "",
        contentType: type ?? ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }

  static void openUrl(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else
      showCustomToast(context, message: "Could not launch $url");
  }

  static Future<void> openWhatsApp({
    required String phoneNumber,
    String message = '',
  }) async {
    try {
      String cleanPhone = phoneNumber
          .replaceAll('+', '')
          .replaceAll(' ', '')
          .replaceAll('-', '')
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll(RegExp(r'[^0-9]'), '');

      String url = 'https://wa.me/$cleanPhone';
      if (message.isNotEmpty) {
        url += '?text=${Uri.encodeComponent(message)}';
      }

      final Uri whatsappUri = Uri.parse(url);
      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print('Error: $e');
    }
  }



  static Color? convertStringToColor (String color)  {
    final colorN =  int.tryParse(color);
    if(colorN == null) return null;
    else return Color(colorN);

  }
}
