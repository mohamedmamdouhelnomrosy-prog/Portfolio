import 'package:flutter/material.dart';

import '../../Utilities/extensions.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    Key? key,
    required this.isSelected,
    this.activeColor,
    this.inactiveColor,
    required this.onTap,
    this.size,
  }) : super(key: key);

  final bool isSelected;

  final Color? activeColor;

  final Color? inactiveColor;
  final VoidCallback onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: Container(
        width: size ?? 24,
        height: size ?? 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade400,
          border: Border.all(
            color: isSelected
                ? (activeColor ?? colors.secondary)
                : Colors.grey.shade400,
            width: 5,
          ),
        ),
        child: isSelected
            ? Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

class CustomRadioWithColor extends StatelessWidget {
  const CustomRadioWithColor({
    super.key,
    this.isSelected = false,
    this.activeColor,
    this.backgroundColor,
  });

  final bool isSelected;

  final Color? activeColor;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      height: 20,
      width: 20,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color:
            isSelected ? backgroundColor ?? colors.secondary : colors.background,
        shape: BoxShape.circle,
        border: Border.all(
          color:
              isSelected ? backgroundColor ?? Colors.transparent : colors.text2,
        ),
      ),
      child: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          color: colors.background,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
