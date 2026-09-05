import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/Header/headline_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/stat_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';

class SummaryDetailsWidget extends StatelessWidget {
  final ProfileEntity? profile;
  final int projectsNumber, certNumber;
  final double hozPadding;

  const SummaryDetailsWidget({
    super.key,
    this.hozPadding = desktopHozPadding,
    required this.profile,
    required this.projectsNumber,
    required this.certNumber,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (context.isLarge) 64.0.heightBox,
        HeadlineWidget(
          profile: profile,
        ),
        const SizedBox(height: 32),
        StatsRow(
          items: [
            Stat(
              value: projectsNumber,
              name: 'Projects Tested',
            ),
            Stat(
              value: certNumber,
              name: 'Certifications',
            ),
            const Stat(
              value: 2,
              name: 'Testing Tracks',
            ),
            const Stat(
              value: 100,
              subTitle: '%',
              name: 'Attention to Detail',
            ),
          ],
        )
      ],
    );
  }
}
