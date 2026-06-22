import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Core/Theme/theme_colors.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/stat_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Widgets/MainLayout/menu_button.dart';
import '../../../../../Widgets/Portfilio/profile_image.dart';

class HomeSummarySection extends StatelessWidget {
  final ProfileEntity? profile;
  final int projectsNumber, certNumber;
  final double hozPadding;
  final double size,height;


  const HomeSummarySection({
    super.key,
    this.hozPadding = desktopHozPadding,
    this.size = 100,
    required this.profile,
    required this.projectsNumber,
    required this.certNumber,
    this.height=400,

  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedBackground(
      height: height,
      child: Padding(
        padding: EdgeInsets.only(left: hozPadding, right: hozPadding, top: 32 ,bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if(context.isLarge)
            _TagBadge(),

            const SizedBox(height: 32),
            Row(
              spacing: 24,
              children: [
              ProfileImage(
              width: size,
              height: size,
              image: profile?.image??"",
            ),

        _Headline(titleStyle: AppTextStyles.headline(context:context,color: colors.text1)),


              ],
            ),
            const SizedBox(height: 16),
            Text(
              "${profile?.firstName ?? ""}${profile?.lastName ?? ""} | ${profile?.jobTitle ?? ""}",
              style: AppTextStyles.title(
                context: context,
                color: colors.text2,
              ),
            ),


            const SizedBox(height: 8),

            Text(
              profile?.summary ?? "",
              style: AppTextStyles.summaryBody(
                context: context,
                color: colors.text3,
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
        ),
      )
    );
  }

}

// ──────────────────────────────────────────
//  TAG BADGE
// ──────────────────────────────────────────
class _TagBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🧪', style: TextStyle(fontSize: 12)),
        const SizedBox(width: 6),
        Text('QA · SOFTWARE TESTING',
            style: AppTextStyles.medium12(color: colors.secondary)),
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
                colors: [colors.secondary, colors.secondary, colors.secondary],
              ).createShader(bounds),
              child: Text(
                'One Test Case at a Time.',
                style: (titleStyle ?? AppTextStyles.semiBold28()).copyWith(color: colors.text3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}