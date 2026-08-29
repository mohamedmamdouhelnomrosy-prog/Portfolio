import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

class ContentItem extends StatelessWidget {
  final ExperienceContentEntity item;
  const ContentItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title ?? "",
            style: AppTextStyles.body(context: context, color: colors.text1)
                .copyWith(
                    decorationThickness: 0.5,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed,
                    decorationColor: colors.text1)),
        ...item.keys.map(
          (e) => PointText(
              point: e,
              style: AppTextStyles.body(context: context, color: colors.text2)),
        ),
      ],
    ).paddingOnly(bottom: 8);
  }
}
