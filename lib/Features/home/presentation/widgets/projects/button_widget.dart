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

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _tapController;
  late Animation<double> _scaleAnimation;

  static const Duration _colorDuration = Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    _tapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.94).animate(
      CurvedAnimation(parent: _tapController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _tapController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) => _tapController.forward();
  void _onTapUp(TapUpDetails _) => _tapController.reverse();
  void _onTapCancel() => _tapController.reverse();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final targetTextColor = widget.selected ? colors.accent : colors.text2;
    final targetBorderColor = widget.selected ? colors.accent : colors.text3;
    final targetBgColor = widget.selected ? colors.accentSoft : colors.surface;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () => widget.onTap(widget.index),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
        child: TweenAnimationBuilder<Color?>(
          tween: ColorTween(end: targetBorderColor),
          duration: _colorDuration,
          curve: Curves.easeOut,
          builder: (context, borderColor, _) {
            return TweenAnimationBuilder<Color?>(
              tween: ColorTween(end: targetBgColor),
              duration: _colorDuration,
              curve: Curves.easeOut,
              builder: (context, bgColor, _) {
                return TweenAnimationBuilder<Color?>(
                  tween: ColorTween(end: targetTextColor),
                  duration: _colorDuration,
                  curve: Curves.easeOut,
                  builder: (context, textColor, _) {
                    return CardWithText(
                      text: widget.title,
                      style: AppTextStyles.buttonTitle(
                        context: context,
                        color: textColor ?? targetTextColor,
                      ),
                      borderColor: borderColor ?? targetBorderColor,
                      color: bgColor ?? targetBgColor,
                      border: 8,
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
