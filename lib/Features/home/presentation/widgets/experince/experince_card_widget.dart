import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/experince/experince_item_card.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_list.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';

class ExperienceSection extends StatelessWidget {
  final double padding;

  const ExperienceSection({
    super.key,
    this.padding = desktopHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    final space = context.matchedSize(large: 32, medium: 24, small: 20);
    return SliverPadding(
      key: GlobalKeys.experince,
      padding: EdgeInsetsGeometry.symmetric(horizontal: padding),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
              child: SectionsTitleWidget(
            index: 4,
            icon: Portfolio.work,
            title: Strings.experience.translate,
          )),
          SliverToBoxAdapter(child: space.heightBox),
          BlocSelector<PortfolioCubit, PortfolioState, List<ExperienceEntity>>(
              selector: (state) => state.data?.experience ?? [],
              builder: (context, experiences) {
                return SliverList.separated(
                  addRepaintBoundaries: true,
                  itemCount: experiences.length,
                  separatorBuilder: (ctx, index) => SizedBox(
                    height: index == experiences.length - 1 ? 0 : 24,
                  ),
                  itemBuilder: (ctx, index) => ScrollReveal(
                    axis: Axis.horizontal,
                    index: index,
                    offset: 8,
                    child: ExperienceCard(
                      experience: experiences[index],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
