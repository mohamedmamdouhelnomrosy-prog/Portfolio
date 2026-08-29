import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final int index;

  const SectionsTitleWidget(
      {super.key,
      required this.title,
      required this.index,
      this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        CardWithText(
          text: '0$index',
          color: Colors.transparent,
          textColor: colors.text2,
          border: 4,
          hozPadding: 4,
          vertPadding: 2,
          borderColor: colors.text3,
        ),
        8.0.widthBox,
        Text(
          title,
          style:
              AppTextStyles.sectionTitle(context: context, color: colors.text1),
        ).expand,
        if (subtitle != null) ...[
          24.0.widthBox,
          CardWithText(
            text: subtitle!,
            textColor: colors.secondary,
            color: colors.secondarySoft,
            hozPadding: 4,
            vertPadding: 4,
            border: 4,
            borderColor: colors.secondary,
            style: AppTextStyles.titleCardSmall(
                context: context, color: colors.secondary),
          ),
        ]
      ],
    );
  }
}
