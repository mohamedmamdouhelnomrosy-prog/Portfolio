import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/domain/entities/tech_skill_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/skills/skill_card.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_list.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';

class SkillsSection extends StatelessWidget {
  final double hozPadding;
  final double iconSize, height;
  final int countPerRow;
  const SkillsSection({
    super.key,
    this.height = 120,
    this.hozPadding = desktopHozPadding,
    this.iconSize = 40,
    this.countPerRow = 4,
  });

  @override
  Widget build(BuildContext context) {
    final spacing = context.matchedSize(large: 32, medium: 24, small: 16);
    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: hozPadding),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: SectionsTitleWidget(
              index: 2,
              icon: Portfolio.skills,
              title: Strings.mySkill.translate,
              key: GlobalKeys.skill,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: spacing),
          ),
          BlocSelector<PortfolioCubit, PortfolioState,
                  List<TechnicalSkillEntity>>(
              selector: (state) => state.data?.skills ?? [],
              builder: (c, skills) => AnimatedGridView(
                    perRow: countPerRow,
                    mainAxisExtent: height,
                    getKey: (u) => ValueKey('${skills[u].id ?? 'skill-${u}'}'),
                    buildChild: (u) => SkillCard(
                      skill: skills[u],
                      iconSize: iconSize,
                    ),
                    items: skills,
                  ))
        ],
      ),
    );
  }
}
