import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';

class ProjectItemCard extends StatelessWidget {
  final ProjectEntity? project;
  final int index;
  final double height;

  const ProjectItemCard({
    super.key,
    this.project,
    required this.height,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width =
        context.matchedSize(large: 268, medium: 260, small: double.infinity);
    final color =
        HelperFunctions.convertStringToColor(project?.platform?.color ?? "");
    return Row(children: [
      if (index % 2 == 0)
        VertGradintDividerWidget(
          color1: colors.accent,
          color2: color ?? colors.accent,
          thickness: 3,
          height: height,
        ),
      AnimatedCardWidget(
        paddingVert: 24,
        width: width,
        paddingHoz: 24,
        height: height,
        child: (i) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Text(
                  project?.title ?? "",
                  style: AppTextStyles.subtitleCard(
                      context: context, color: colors.text1),
                  maxLines: 2,
                ).expand,
                CardWithText(
                  text: project?.isManual == true ? 'Manual' : "Automation",
                  color: project?.isManual == true
                      ? colors.accentSoft
                      : colors.secondarySoft,
                  borderColor: Colors.transparent,
                  maxLine: 2,
                  border: 0,
                  style: AppTextStyles.titleCardSmall(
                      context: context,
                      color: project?.isManual == true
                          ? colors.accent
                          : colors.secondary),
                )
              ],
            ),
            Column(
              spacing: 4,
              children: List.generate(
                project?.keyTasks.length ?? 0,
                (i) => PointText(
                  point: project?.keyTasks[i] ?? "",
                ),
              ),
            ).expand,
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              children: [
                ...?project?.links.map((e) {
                  final type = LinkType.values.firstWhere((i) {
                    return i.name == e.linkType?.type;
                  });
                  return CustomButtonWidget.outLined(
                    height: 24,
                    borderColor: colors.border,
                    borderRadiusValue: 0,
                    child: Row(
                      spacing: 4,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          type == LinkType.android
                              ? Icons.android_outlined
                              : type == LinkType.ios
                                  ? Icons.apple_outlined
                                  : Icons.language_outlined,
                          size: 12,
                          color: type == LinkType.android
                              ? colors.secondary
                              : type == LinkType.ios
                                  ? colors.accent
                                  : colors.text1,
                        ),
                        Text(
                          e.name ?? '',
                          style: AppTextStyles.titleCardSmall(
                            context: context,
                            color: type == LinkType.android
                                ? colors.secondary
                                : type == LinkType.ios
                                    ? colors.accent
                                    : colors.text1,
                          ),
                        )
                      ],
                    ),
                  );
                })
              ],
            )
          ],
        ),
      ).expand,
      if (index % 2 != 0)
        VertGradintDividerWidget(
          color1: colors.accent,
          color2: color ?? colors.accent,
          thickness: 3,
          height: height,
        ),
    ]);
  }
}
