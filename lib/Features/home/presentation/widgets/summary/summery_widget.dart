import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/summary_details_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';

class SummarySection extends StatelessWidget {
  final double hozPadding;
  final double iconSize, height;
  final int countPerRow;
  const SummarySection({
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
              index: 1,
              icon: Portfolio.summary,
              title: Strings.aboutMe.translate,
              key: GlobalKeys.aboutMe,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: spacing),
          ),
          BlocSelector<PortfolioCubit, PortfolioState, ProfileEntity?>(
              selector: (state) => state.data?.profile,
              builder: (c, skills) => const SummaryDetailsWidget())
        ],
      ),
    );
  }
}
