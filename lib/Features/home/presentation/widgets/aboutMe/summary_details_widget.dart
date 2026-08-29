import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
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
        _Headline(
            titleStyle:
                AppTextStyles.headline(context: context, color: colors.text1)),
        const SizedBox(height: 16),
        Text(
          profile?.summary ?? "",
          style: AppTextStyles.summaryBody(
            context: context,
            color: colors.text2,
          ),
        ),
        const SizedBox(height: 32),
        StatsRow(
          numStyle: AppTextStyles.summaryNumberLarge(context: context),
          titleStyle: AppTextStyles.summaryNumberMedium(context: context),
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

// ──────────────────────────────────────────
//  GRADIENT HEADLINE
// ──────────────────────────────────────────
class _Headline extends StatelessWidget {
  final TextStyle? titleStyle;
  const _Headline({this.titleStyle});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return RichText(
      text: TextSpan(
        style: AppTextStyles.medium20(color: colors.text3),
        children: [
          TextSpan(
            text: 'Ensuring Quality,\n',
            style: titleStyle ?? AppTextStyles.semiBold28(color: colors.text1),
          ),
          WidgetSpan(
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [colors.accent, colors.accent, colors.accentSoft],
              ).createShader(bounds),
              child: Text(
                'One Test Case at a Time.',
                style: (titleStyle ?? AppTextStyles.semiBold28())
                    .copyWith(color: colors.accent),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
