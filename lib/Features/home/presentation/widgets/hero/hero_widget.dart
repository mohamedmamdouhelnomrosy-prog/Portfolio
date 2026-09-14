import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/hero/basic_data_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/hero/details/hero_details_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';

class HomeSummarySection extends StatelessWidget {
  final double hozPadding;
  final double size, height;

  const HomeSummarySection({
    super.key,
    this.hozPadding = desktopHozPadding,
    this.size = 88,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.only(
            left: hozPadding, right: hozPadding, top: 32, bottom: 16),
        sliver: context.isLarge ? largePreview() : smallPreview(context));
  }

  Widget largePreview() => SliverCrossAxisGroup(
        slivers: [
          const HeroDetailsWidget(),
          BasicDataWidget(
            height: height,
            size: size,
          ),
        ],
      );
  Widget smallPreview(BuildContext context) => SliverMainAxisGroup(
        slivers: [
          const HeroDetailsWidget(),
          SliverToBoxAdapter(
            child: 32.0.heightBox,
          ),
          BasicDataWidget(
            height: context.isSmall ? 260 : 280,
            size: size,
          ),
        ],
      );
}
