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

  const ProjectItemCard({
    super.key,
    this.project,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width =
        context.matchedSize(large: 268, medium: 260, small: double.infinity);
    final color =
        HelperFunctions.convertStringToColor(project?.platform?.color ?? "");
    return AnimatedCardWidget(
        paddingVert: 0,
        width: width,
        height: context.isSmall ? null : 300,
        child: (i) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                GradintDividerWidget(
                  color1: colors.accent,
                  color2: color ?? colors.accent,
                  thickness: 3,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    Text(
                      project?.title ?? "",
                      style: AppTextStyles.titleCardLarge(
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
                      border: 4,
                      style: AppTextStyles.titleCardSmall(
                          context: context,
                          color: project?.isManual == true
                              ? colors.accent
                              : colors.secondary),
                    )
                  ],
                ),
                Text('Verified'.toUpperCase(),
                    style: AppTextStyles.titleCardSmall(
                        context: context, color: colors.accent)),
                ...List.generate(
                  project?.keyTasks.length ?? 0,
                  (i) => PointText(
                    point: project?.keyTasks[i] ?? "",
                  ),
                ),
                if (project?.links != null && project!.links.isNotEmpty)
                  const DividerWidget(
                    thickness: 0.4,
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    ...?project?.links.map((e) {
                      final type = LinkType.values.firstWhere((i) {
                        return i.name == e.linkType?.type;
                      });
                      return CustomButtonWidget(
                        height: 24,
                        btnColor: type == LinkType.android
                            ? colors.secondarySoft
                            : type == LinkType.ios
                                ? colors.accentSoft
                                : colors.text3,
                        borderRadiusValue: 4,
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
            ));
  }
}
