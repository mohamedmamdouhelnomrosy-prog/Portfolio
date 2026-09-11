import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_list.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'education_card.dart';

class EducationSection extends StatelessWidget {
  final double padding;
  const EducationSection({
    super.key,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    final space = context.matchedSize(large: 32, medium: 24, small: 20);
    return SliverPadding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: padding),
        sliver: SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
                child: SectionsTitleWidget(
              key: GlobalKeys.education,
              index: 1,
              icon: Portfolio.education,
              title: Strings.education.translate,
            )),
            SliverToBoxAdapter(child: space.heightBox),
            SliverToBoxAdapter(
                child: BlocSelector<PortfolioCubit, PortfolioState,
                    EducationEntity?>(
              selector: (state) => state.data?.education.firstOrNull,
              builder: (context, education) => ScrollReveal(
                  index: 0,
                  offset: 20,
                  axis: Axis.horizontal,
                  child: EducationCard(
                    item: education,
                  )),
            ))
          ],
        ));
  }
}
