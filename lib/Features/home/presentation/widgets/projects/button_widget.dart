import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../Core/Language/app_styles.dart';

class ButtonWidget extends StatefulWidget {
  final String title;
  final double width;
  final int index;
  final bool selected;
  final Function(int index) onTap;

  const ButtonWidget(
      {super.key,
      this.selected = false,
      required this.title,
      this.width = 140,
      required this.index,
      required this.onTap});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool hover = false;
  void hovering(bool h) => setState(() {
        hover = h;
      });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MouseRegion(
        onEnter: (_) => hovering(true),
        onExit: (_) => hovering(false),
        child: GestureDetector(
          onTap: () {
            widget.onTap(widget.index);
            setState(() {});
          },
          child: CardWithText(
            text: widget.title,
            style: AppTextStyles.buttonTitle(
                context: context,
                color: widget.selected ? colors.accent : colors.text2),
            borderColor: widget.selected ? colors.accent : colors.text3,
            color: widget.selected ? colors.accentSoft : colors.surface,
            border: 8,
          ),
        ));
  }
}
