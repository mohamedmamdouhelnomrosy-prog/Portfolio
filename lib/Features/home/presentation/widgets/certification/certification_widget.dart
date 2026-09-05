import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import 'certification_card.dart';

class CertificationSection extends StatelessWidget {
  final List<CertificateEntity> data;
  final double hozPadding;

  const CertificationSection(
      {super.key, this.hozPadding = desktopHozPadding, this.data = const []});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          index: 5,
          icon: Portfolio.certification,
          title: Strings.certification.translate,
          key: GlobalKeys.certification,
        ),
        Column(
          children: List.generate(
            data.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == data.length - 1 ? 0 : 24,
              ),
              child: CertificationCard(
                item: data[index],
                imageHeight: 40,
                imageWidth: 64,
              ),
            ),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: hozPadding);
  }
}
