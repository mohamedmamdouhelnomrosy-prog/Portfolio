import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomHireButton extends StatefulWidget {
  final String? email;

  const CustomHireButton({super.key, this.email});

  @override
  State<CustomHireButton> createState() => _CustomHireButtonState();
}

class _CustomHireButtonState extends State<CustomHireButton> {
  bool hover = false;
  void hovering(bool h) => setState(() {
        hover = h;
      });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.isLarge
        ? lThemeButtonSize
        : context.isMedium
            ? mThemeButtonSize
            : sThemeButtonSize;

    return MouseRegion(
      onEnter: (_) => hovering(true),
      onExit: (_) => hovering(false),
      child: AnimatedScale(
          scale: hover ? 1.02 : 1,
          duration: const Duration(milliseconds: 250),
          child: CustomButtonWidget(
            borderRadiusValue: 0,
            onPressed: () async {
              final Uri emailUri =
                  Uri(scheme: 'mailto', path: widget.email ?? "");
              if (await canLaunchUrl(emailUri)) {
                await launchUrl(emailUri);
              }
            },
            btnColor: hover
                ? colors.secondary.withValues(alpha: 0.9)
                : colors.secondary,
            height: size,
            width: double.infinity,
            child: Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hire Me',
                  style: AppTextStyles.buttonTitle(
                    context: context,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Portfolio.email,
                  color: Colors.white,
                  size: size / 2.5,
                ),
              ],
            ),
          )),
    );
  }
}
