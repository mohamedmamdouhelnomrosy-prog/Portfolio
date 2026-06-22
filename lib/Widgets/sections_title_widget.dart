import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;

  const SectionsTitleWidget(
      {super.key,
      required this.title,
      this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        SizedBox(width:20,child:  DividerWidget(thickness: 2,color: colors.secondary,)),
        8.0.widthBox,

        Text(
          title,
          style: AppTextStyles.sectionTitle(context: context ,color: colors.text2),
        ).expand,


        if (subtitle != null)
         ... [
        24.0.widthBox,
           CardWithText(
            text: subtitle!,
            textColor: colors.secondary,
            color: colors.secondary25,
            hozPadding: 4,
            vertPadding: 4,
            borderColor: colors.secondary25,
            style:  AppTextStyles.titleCardSmall(context: context,color: colors.secondary),
          ),]
      ],
    );
  }
}
