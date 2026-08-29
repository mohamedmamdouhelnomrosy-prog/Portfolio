import 'package:flutter/material.dart';

import '../../Core/Language/app_styles.dart';
import '../../Utilities/extensions.dart';
import '../Inputs/app_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final bool isLoading;
  final Function()? onPressed;

  final double? width, height, borderRadiusValue;
  final String? title;
  final TextStyle? titleStyle;
  final BorderRadiusGeometry? borderRadius;
  final FocusNode? focusNode;
  final Widget? child;
  final Color? btnColor, titleColor, borderColor;
  final BoxShadow? boxShadow;

  const CustomButtonWidget(
      {super.key,
      this.width,
      this.height,
      this.title,
      this.onPressed,
      this.child,
      this.focusNode,
      this.borderRadiusValue,
      this.isLoading = false,
      this.btnColor,
      this.borderColor,
      this.titleColor,
      this.borderRadius,
      this.titleStyle,
      this.boxShadow});

  const CustomButtonWidget.outLined(
      {super.key,
      this.width,
      this.height,
      this.title,
      this.titleStyle,
      this.onPressed,
      this.child,
      this.focusNode,
      this.borderRadiusValue,
      this.isLoading = false,
      this.borderColor,
      this.boxShadow,
      this.borderRadius,
      this.titleColor})
      : btnColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: () => handleTap(
        context: context,
        isLoading: isLoading,
        onPressed: onPressed,
      ),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 36.0,
        width: width,
        padding: width != null
            ? null
            : const EdgeInsetsGeometry.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius:
              borderRadius ?? BorderRadius.circular(borderRadiusValue ?? 100.0),
          color: btnColor ?? colors.accent,
          boxShadow: boxShadow == null ? null : [boxShadow!],
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                color: colors.text2,
              ))
            : child ??
                AppTextWidget(
                  title ?? "",
                  style: titleStyle ??
                      AppTextStyles.regular14()
                          .copyWith(color: titleColor ?? colors.text1),
                ),
      ),
    );
  }

  void handleTap({
    required BuildContext context,
    required bool isLoading,
    VoidCallback? onPressed,
  }) {
    if (isLoading) return;
    onPressed?.call();
  }
}
