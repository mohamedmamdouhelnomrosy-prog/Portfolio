import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/experince/experince_item_card.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';

class ExperienceSection extends StatelessWidget {
  final List<ExperienceEntity> experiences;
  final double hozPadding;

  const ExperienceSection(
      {super.key,
      this.hozPadding = desktopHozPadding,
      this.experiences = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        SectionsTitleWidget(
          icon: Portfolio.work,
          title: Strings.experience.translate.toUpperCase(),
          key: GlobalKeys.experince,
        ),
        ...experiences.map((exp) {
          return ExperienceCard(
            experience: exp,

          );
        }),
      ],
    ).paddingSymmetric(horizontal: hozPadding);
  }
}
