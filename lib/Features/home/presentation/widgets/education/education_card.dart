import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../../../../../Widgets/Custom/card_with_animation.dart';

class EducationCard extends StatelessWidget {
  final EducationEntity? item;

  const EducationCard({
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width = context.matchedSize(
        large: context.width * (1 / 3),
        medium: context.width * (3 / 4),
        small: context.width);
    return SideAnimatedCard(
        width: width,
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 16,
              children: [
                Text(
                  item?.degree ?? "",
                  style: AppTextStyles.titleCardLarge(
                    context: context,
                    color: colors.text1,
                  ),
                ).expand,
                Text(
                  item?.duration ?? "",
                  style: AppTextStyles.titleCardSmall(
                    context: context,
                    color: colors.text2,
                  ),
                ),
              ],
            ),
            Text(
              item?.university ?? "",
              style: AppTextStyles.subtitleCard(
                context: context,
                color: colors.secondary,
              ),
            ),
            Text(
              'Grade: ${item?.grade ?? ""}',
              style: AppTextStyles.subtitleCard(
                context: context,
                color: colors.text2,
              ),
            ),
            const DividerWidget(),
            Text(
              (item?.gradProjectTitle ?? ""),
              style: AppTextStyles.body(
                context: context,
                color: colors.text2,
              ),
            ),
            Text(
              (item?.graduationProjectDesc ?? ""),
              style: AppTextStyles.body(
                context: context,
                color: colors.text2,
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 16,
              children: [
                ...List.generate(
                  item?.gradProjectTech.length ?? 0,
                  (i) => CardWithText(
                    borderColor: Colors.transparent,
                    color: colors.accentSoft,
                    text: item?.gradProjectTech[i] ?? "",
                    border: 0,
                    style: AppTextStyles.titleCardSmall(
                      context: context,
                      color: colors.accent,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
