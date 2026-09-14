import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';

import '../../Core/Language/app_styles.dart';

class CardWithText extends StatelessWidget {
  final String text;
  final Color color, borderColor;
  final Color? textColor;
  final double border, hozPadding, vertPadding;
  final TextStyle? style;
  final int maxLine;
  const CardWithText(
      {super.key,
      required this.text,
      required this.color,
      required this.borderColor,
      this.border = 100,
      this.hozPadding = 12,
      this.vertPadding = 4,
      this.style,
      this.maxLine = 1,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: hozPadding, vertical: vertPadding),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(border),
          border: Border.all(color: borderColor, width: 0.4)),
      child: Text(
        text,
        style: style ??
            AppTextStyles.titleCardSmall(
              context: context,
              color: textColor,
            ),
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class HoverdCardWithText extends StatelessWidget {
  final String text;
  final Color color, borderColor, hoverColor;
  final Color? textColor;
  final double border, hozPadding, vertPadding;
  final TextStyle? style;
  final int maxLine;
  const HoverdCardWithText(
      {super.key,
      required this.text,
      required this.color,
      required this.borderColor,
      this.border = 100,
      this.hozPadding = 12,
      this.vertPadding = 4,
      this.style,
      required this.hoverColor,
      this.maxLine = 1,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InteractiveCard(
        child: (hover) => Container(
              padding: EdgeInsets.symmetric(
                  horizontal: hozPadding, vertical: vertPadding),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(border),
                  border: Border.all(
                      color: hover ? hoverColor : borderColor, width: 0.4)),
              child: Text(
                text,
                style: (style ?? AppTextStyles.titleCardSmall(context: context))
                    .copyWith(
                  color: hover ? hoverColor : textColor,
                ),
                maxLines: maxLine,
                overflow: TextOverflow.ellipsis,
              ),
            ));
  }
}
