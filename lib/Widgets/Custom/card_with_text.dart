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
          border: Border.all(color: borderColor)),
      child: Text(
        text,
        style: style ??
            AppTextStyles.regular12(
              color: textColor,
            ),
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class AnimatedCardWithText extends StatelessWidget {
  final String text;
  final Color color, animatedColor, borderColor;
  final Color? textColor, animatedTextColor;
  final double border, hozPadding, vertPadding;
  final TextStyle? style;
  final int maxLine;
  const AnimatedCardWithText(
      {super.key,
      required this.text,
      required this.color,
      required this.borderColor,
      this.border = 100,
      this.hozPadding = 12,
      this.vertPadding = 4,
      this.style,
      this.maxLine = 1,
      this.textColor,
      this.animatedTextColor,
      required this.animatedColor});

  @override
  Widget build(BuildContext context) {
    return BasicAnimatedCardWidget(
      paddingHoz: hozPadding,
      paddingVert: vertPadding,
      cardColor: color,
      animatedColor: animatedColor,
      animatedBorderColor: animatedColor,
      borderColor: borderColor,
      border: border,
      child: (h) => Text(
        text,
        style: style ??
            AppTextStyles.regular12(
              color: h ? animatedTextColor : textColor,
            ),
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
