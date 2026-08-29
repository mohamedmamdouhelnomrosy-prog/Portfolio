import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/basic_data_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/summary_details_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/constants.dart';

class HomeSummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  final int projectsNumber, certNumber;
  final double hozPadding;
  final double size, height;

  const HomeSummarySection({
    super.key,
    this.hozPadding = desktopHozPadding,
    this.size = 88,
    required this.profile,
    required this.projectsNumber,
    required this.certNumber,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: hozPadding, right: hozPadding, top: 32, bottom: 16),
        child: context.isLarge ? LargePreview() : SmallPreview(context));
  }

  Widget LargePreview() => Row(
        spacing: 40,
        children: [
          SummaryDetailsWidget(
                  profile: profile,
                  projectsNumber: projectsNumber,
                  certNumber: certNumber)
              .expandFlex(2),
          BasicDataWidget(
            profile: profile,
            height: height,
            size: size,
          ).center.expand,
        ],
      );
  Widget SmallPreview(BuildContext context) => Column(
        spacing: 32,
        children: [
          SummaryDetailsWidget(
              profile: profile,
              projectsNumber: projectsNumber,
              certNumber: certNumber),
          BasicDataWidget(
            profile: profile,
            height: context.isSmall ? 260 : 280,
            size: size,
          ),
        ],
      );
}
