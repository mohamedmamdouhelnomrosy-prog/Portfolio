import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Widgets/Buttons/custom_button_widget.dart';

class ContactButton extends StatefulWidget {
  final double border;
  final Function() onTap;
  final IconData icon;
  final String title;
  final Color? backgroundColor, borderColor, iconColor;
  const ContactButton(
      {super.key,
      this.border = 8,
      required this.onTap,
      required this.icon,
      this.backgroundColor,
      this.borderColor,
      this.iconColor,
      required this.title});

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
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
            borderRadiusValue: widget.border,
            onPressed: widget.onTap,
            width: context.isLarge ? 120 : 80,
            btnColor: widget.backgroundColor ?? Colors.transparent,
            borderColor:
                hover ? colors.accent : widget.borderColor ?? colors.text2,
            height: size,
            child: Row(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.icon,
                  color:
                      hover ? colors.accent : widget.iconColor ?? colors.text2,
                  size: size / 2,
                ),
                Text(
                  widget.title,
                  style: AppTextStyles.buttonTitle(
                    context: context,
                    color: hover
                        ? colors.accent
                        : widget.iconColor ?? colors.text2,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
