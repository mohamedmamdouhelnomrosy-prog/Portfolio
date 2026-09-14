import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

class SkillCard extends StatelessWidget {
  final TechnicalSkillEntity? skill;
  final double iconSize, width;

  const SkillCard({
    super.key,
    required this.skill,
    this.iconSize = 40,
    this.width = 260,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedCardWidget(
      width: width,
      child: (h) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skill?.category ?? "",
                style: (AppTextStyles.subtitleCard(
                  context: context,
                  color: colors.accent,
                )),
              ).expand,
              Text(
                "( ${skill?.skills.length.toString() ?? "0"} )",
                style: (AppTextStyles.titleCardSmall(
                  context: context,
                  color: colors.text2,
                )),
              ),
            ],
          ).expand,
          Wrap(
            spacing: 4,
            runSpacing: 8,
            children: [
              ...List.generate(
                  skill?.skills.length ?? 0,
                  (i) => HoverdCardWithText(
                        text: (skill?.skills[i].skillName ?? ""),
                        style: AppTextStyles.label(
                            context: context, color: colors.text2),
                        maxLine: 3,
                        border: 0,
                        hozPadding: 8,
                        color: Colors.transparent,
                        borderColor: colors.border,
                        textColor: colors.text2,
                        hoverColor: colors.secondary,
                      ))
            ],
          )
        ],
      ),
    );
  }
}
