import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Widgets/Buttons/custom_button_widget.dart';

class ContactButton extends StatefulWidget {
  final double border;
  final Function() onTap;
  final IconData icon;
  final Color? backgroundColor, borderColor, iconColor;
  const ContactButton(
      {super.key,
        this.border=8,
      required this.onTap,
      required this.icon,
      this.backgroundColor,
      this.borderColor,
      this.iconColor});

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
    final size =context.isLarge?lThemeButtonSize:context.isMedium?mThemeButtonSize:sThemeButtonSize;

    return MouseRegion(
      onEnter: (_) => hovering(true),
      onExit: (_) => hovering(false),
      child: AnimatedScale(
        scale: hover ? 1.02 : 1,
        duration: const Duration(milliseconds: 250),
        child: CustomButtonWidget(
          borderRadiusValue: widget.border,
          onPressed: widget.onTap,
          btnColor: widget.backgroundColor ?? Colors.transparent,
          borderColor: hover
              ? colors.secondary
              : widget.borderColor ?? colors.text2,
          width: size,
          height:size,
          child: Icon(
            widget.icon,
            color: hover
                ? colors.secondary
                : widget.iconColor ?? colors.text2,
            size: size/2,
          ),
        ),
      ),
    );
  }
}
