import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

class RoundedDotedWidget extends StatelessWidget {
  final double innerRadius, padding;

  const RoundedDotedWidget(
      {super.key, this.innerRadius = 16, this.padding = 8});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DottedBorder(
      options: CircularDottedBorderOptions(
          color: colors.text2,
          borderPadding: EdgeInsets.zero,
          padding: EdgeInsets.all(padding),
          stackFit: StackFit.passthrough),
      child: CircleAvatar(
        radius: innerRadius,
        backgroundColor: colors.accent,
      ),
    );
  }
}
