import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomHireButton extends StatelessWidget {
  final String? email;
  const CustomHireButton({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.matchedSize(
        large: lThemeButtonSize,
        medium: mThemeButtonSize,
        small: sThemeButtonSize);
    return CustomButtonWidget(
        onPressed: () async {
          final Uri emailUri = Uri(scheme: 'mailto', path: email ?? "");
          if (await canLaunchUrl(emailUri)) {
            await launchUrl(emailUri);
          }
        },
        btnColor: colors.secondarySoft,
        height: size,
        width: 96,
        borderRadiusValue: 8,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Text(
                'Hire Me',
                style: AppTextStyles.buttonTitle(
                    context: context, color: colors.secondary),
              ),
              Icon(Portfolio.email, size: 14, color: colors.secondary),
            ]));
  }
}
