import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/education_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'education_card.dart';

class EducationSection extends StatelessWidget {
  final List<EducationEntity> education;
  final double padding;
  const EducationSection(
      {super.key, this.padding = 20, this.education = const []});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 16,
      key: GlobalKeys.education,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          index: 1,
          icon: Portfolio.education,
          title: Strings.education.translate,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: education.length,
          itemBuilder: (context, index) {
            return EducationCard(
              item: education[index],
            );
          },
        ),
      ],
    ).paddingOnly(start: padding, end: padding);
  }
}
