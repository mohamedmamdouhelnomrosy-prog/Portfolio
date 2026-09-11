import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/basic_data_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/details/summary_details_widget.dart';
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
        sliver: context.isLarge ? LargePreview() : SmallPreview(context));
  }

  Widget LargePreview() => SliverCrossAxisGroup(
        slivers: [
          const SummaryDetailsWidget(),
          BasicDataWidget(
            height: height,
            size: size,
          ),
        ],
      );
  Widget SmallPreview(BuildContext context) => SliverMainAxisGroup(
        slivers: [
          const SummaryDetailsWidget(),
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
