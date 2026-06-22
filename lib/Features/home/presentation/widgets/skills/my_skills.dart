import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';

class SkillsSection extends StatelessWidget {
  final List<TechnicalSkillEntity> skills;
  final double hozPadding;
  final double iconSize,height;
  final int countPerRow;
  const SkillsSection(
      {super.key,
        this.height=120,
      this.skills = const [],
      this.hozPadding = desktopHozPadding,
      this.iconSize = 40,  this.countPerRow =4,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 24,
      children: [
        SectionsTitleWidget(
          icon: Portfolio.skills,
          title: Strings.mySkill.translate.toUpperCase(),
          key: GlobalKeys.skill,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:countPerRow,
              mainAxisExtent: height,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16),
          itemBuilder: (c, u) => SkillCard(
            skill: skills[u],
            iconSize: iconSize,

          ),
          itemCount: skills.length,
        )
      ],
    ).paddingSymmetric(horizontal: hozPadding);
  }
}
