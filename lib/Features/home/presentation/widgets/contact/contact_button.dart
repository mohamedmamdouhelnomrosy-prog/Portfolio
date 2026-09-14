import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Utilities/extensions.dart';

class ContactButton extends StatefulWidget {
  final double border;
  final Function()? onTap;
  final IconData icon;
  final String title, value;
  final Color? backgroundColor, borderColor, iconColor;
  const ContactButton(
      {super.key,
      this.border = 8,
      required this.onTap,
      required this.icon,
      this.backgroundColor,
      this.borderColor,
      this.iconColor,
      required this.value,
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

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context.isSmall ? 8 : 24, vertical: 16),
      decoration:
          BoxDecoration(border: Border.all(color: colors.border, width: 0.4)),
      child: MouseRegion(
          onEnter: (_) => hovering(true),
          onExit: (_) => hovering(false),
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.summaryNumberMedium(
                  context: context,
                  color: widget.iconColor ?? colors.text2,
                ),
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  widget.value,
                  style: AppTextStyles.buttonTitle(
                    context: context,
                    color: hover ? colors.accent : colors.text1,
                  ).copyWith(
                      decorationColor:
                          hover ? colors.accent : Colors.transparent,
                      decoration: hover ? TextDecoration.underline : null),
                ),
              )
            ],
          )),
    );
  }
}
