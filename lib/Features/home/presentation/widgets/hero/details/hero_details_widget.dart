import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/hero_contact.dart';
import 'package:portfolio/Features/home/presentation/widgets/hero/details/headline_widget.dart';

import '../../../../../../Utilities/Constants/constants.dart';

class HeroDetailsWidget extends StatelessWidget {
  final double hozPadding;

  const HeroDetailsWidget({
    super.key,
    this.hozPadding = desktopHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverMainAxisGroup(
      slivers: [
        HeadlineWidget(),
        SliverToBoxAdapter(child: SizedBox(height: 40)),
        SliverToBoxAdapter(
          child: HeroContact(),
        )
      ],
    );
  }
}
