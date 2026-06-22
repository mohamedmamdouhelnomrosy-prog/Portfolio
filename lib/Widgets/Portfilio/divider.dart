import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class DividerWidget extends StatelessWidget {
  final double thickness;
  final Color? color;
  const DividerWidget({super.key, this.thickness = 1, this.color});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Divider(
      color: color??colors.border,
      thickness: thickness,
    );
  }
}

class GradintDividerWidget extends StatelessWidget {
  final double thickness;
  final Color color1, color2;
  const GradintDividerWidget(
      {super.key,
      this.thickness = 1,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: thickness,
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: [color1, color2])),
    );
  }
}

class VertGradintDividerWidget extends StatelessWidget {
  final double thickness,height;
  final Color color1, color2;
  const VertGradintDividerWidget(
      {super.key,
        this.thickness = 1,
        this.height =20,
        required this.color1,
        required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: thickness,
      decoration:
      BoxDecoration(gradient: LinearGradient(colors: [color1, color2])),
    );
  }
}
