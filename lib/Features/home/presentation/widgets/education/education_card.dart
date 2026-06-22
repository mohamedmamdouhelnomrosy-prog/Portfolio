import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../../../../../Widgets/Custom/card_with_animation.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity item;

  const EducationCard({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors =context.colors;
      return SideAnimatedCard(child:

     Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: 16,
          children: [
            Text(
              item.degree ?? "",
              style: AppTextStyles.titleCardLarge(
                context: context,
                color: colors.text1,
              ),
            ).expand,

            CardWithText(
              text: item.duration ?? "",
              style: AppTextStyles.titleCardSmall(
                context: context,
                color: colors.text2,
              ),

              border: 8,
              color: colors.border.withValues(alpha: 0.4),
              borderColor: Colors.transparent,
            ),
          ],
        ),
        Text(
          item.university ?? "",
          style: AppTextStyles.subtitleCard(
            context: context,
            color: colors.text2,
          ),
        ),

        Text(
          'Grade: ${item.grade ?? ""}',
          style: AppTextStyles.body(
            context: context,
            color: colors.text3,
          ),
        ),
        Text(
          (item.gradProjectTitle ?? ""),
          style: AppTextStyles.body(
            context: context,
            color: colors.text3,
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            ...List.generate(
              item.gradProjectTech.length,
              (i) => CardWithText(
                borderColor: Colors.transparent,
                color: colors.secondary.withValues(alpha: 0.1),
                text: item.gradProjectTech[i],
                border: 4,
                style: AppTextStyles.titleCardSmall(
                  context: context,
                  color: colors.secondary,
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
