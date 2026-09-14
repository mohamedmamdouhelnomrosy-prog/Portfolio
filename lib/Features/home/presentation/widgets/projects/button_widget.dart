import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../Core/Language/app_styles.dart';

class ButtonWidget extends StatefulWidget {
  final String title;
  final int index;
  final bool selected;
  final Function(int index) onTap;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
    this.selected = false,
  });

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _isPressed = false;
  bool _isHovered = false;

  void _setPressed(bool value) {
    if (_isPressed == value) return;

    setState(() {
      _isPressed = value;
    });
  }

  void _setHovered(bool value) {
    if (_isHovered == value) return;

    setState(() {
      _isHovered = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final textColor = widget.selected ? colors.accent : colors.text2;

    final borderColor = widget.selected ? colors.accent : colors.text3;

    final backgroundColor =
        widget.selected ? colors.accentSoft : colors.surface;

// Press has priority over hover.
    final scale = _isPressed
        ? 0.94
        : _isHovered
            ? 1.02
            : 1.0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      onTap: () => widget.onTap(widget.index),
      child: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        child: TweenAnimationBuilder<Color?>(
          tween: ColorTween(
            end: backgroundColor,
          ),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          builder: (context, bgColor, _) {
            return TweenAnimationBuilder<Color?>(
              tween: ColorTween(
                end: borderColor,
              ),
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              builder: (context, currentBorderColor, _) {
                return TweenAnimationBuilder<Color?>(
                  tween: ColorTween(
                    end: textColor,
                  ),
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  builder: (context, currentTextColor, _) {
                    return CardWithText(
                      text: widget.title,
                      vertPadding: 8,
                      hozPadding: 20,
                      style: AppTextStyles.buttonTitle(
                        context: context,
                        color: currentTextColor ?? textColor,
                      ),
                      borderColor: currentBorderColor ?? borderColor,
                      color: bgColor ?? backgroundColor,
                      border: 0,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
