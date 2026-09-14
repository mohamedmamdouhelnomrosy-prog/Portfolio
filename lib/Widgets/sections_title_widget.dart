import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../Core/Language/app_styles.dart';

class SectionsTitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final int index;

  const SectionsTitleWidget({
    super.key,
    required this.title,
    required this.index,
    this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        Row(
          spacing: 8,
          children: [
            CardWithText(
              text: 'SECTION 0$index',
              color: Colors.transparent,
              textColor: colors.secondary,
              border: 0,
              hozPadding: 4,
              vertPadding: 2,
              borderColor: colors.border,
            ),
            const DividerWidget().expand
          ],
        )
            .animate()
            .fadeIn(
              duration: 350.ms,
              curve: Curves.easeOut,
            )
            .slideX(
              begin: -0.15,
              end: 0,
              duration: 350.ms,
              curve: Curves.easeOutCubic,
            ),
        Text(
          title.toUpperCase(),
          style: AppTextStyles.sectionTitle(
            context: context,
            color: colors.text1,
          ),
        )
            .animate(delay: 100.ms)
            .fadeIn(
              duration: 450.ms,
              curve: Curves.easeOut,
            )
            .slideX(
              begin: -0.08,
              end: 0,
              duration: 450.ms,
              curve: Curves.easeOutCubic,
            ),
        if (subtitle != null) ...[
          24.0.widthBox,
          CardWithText(
            text: subtitle!,
            textColor: colors.secondary,
            color: colors.secondarySoft,
            hozPadding: 4,
            vertPadding: 4,
            border: 0,
            borderColor: colors.secondary,
            style: AppTextStyles.titleCardSmall(
              context: context,
              color: colors.secondary,
            ),
          )
              .animate(delay: 200.ms)
              .fadeIn(
                duration: 400.ms,
                curve: Curves.easeOut,
              )
              .slideX(
                begin: 0.1,
                end: 0,
                duration: 400.ms,
                curve: Curves.easeOutCubic,
              ),
        ],
      ],
    );
  }
}
