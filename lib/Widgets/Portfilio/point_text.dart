import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Core/Language/app_styles.dart';

class PointText extends StatelessWidget {
  final String point;
  final TextStyle? style;
  const PointText({super.key, required this.point, this.style});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Icon(
          Icons.check,
          color: colors.accent,
          size: 14,
        ),
        Text(point,
                maxLines: 2,
                style:
                    AppTextStyles.body(context: context, color: colors.text2))
            .expand
      ],
    );
  }
}
