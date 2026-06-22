import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
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

    final color =HelperFunctions.convertStringToColor(project?.platform?.color??"");
    return AnimatedCardWidget(
        paddingVert: 0,
        width: context.isLarge ? 268 : context.isSmall ? double.infinity:260,
        height: context.isSmall?null: 260,
        child: (i) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                GradintDividerWidget(
                  color1: colors.secondary,
                  color2:color?? colors.secondary,
                  thickness: 2,
                ),
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      project?.title ?? "",
                      style: AppTextStyles.titleCardLarge(context:context,color: colors.text1),
                      maxLines: 2,
                    ).expand,
                    CardWithText(
                      text: project?.platform?.name ?? "",
                      color: (color?? colors.secondary).withValues(alpha: 0.1),
                      borderColor:Colors.transparent,
                      textColor:color?? colors.secondary,
                      maxLine: 2,
                      border: 8,
                      style: AppTextStyles.titleCardSmall(context:context,color:color?? colors.secondary),
                    )
                  ],
                ),
                Text('Test Cases'.toUpperCase(),
                    style: AppTextStyles.subtitleCard(context:context,color: colors.text3)),
                ...List.generate(
                  project?.keyTasks.length ?? 0,
                  (i) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PointText(
                          point: project?.keyTasks[i] ?? "",),
                      if (i < (project?.keyTasks.length ?? 0) - 1)
                        const DividerWidget(),
                    ],
                  ),
                ),
                8.0.heightBox,
              ],
            ));
  }
}
