import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/hire_me_button.dart';
import 'package:portfolio/Widgets/Buttons/resume_button.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';
import 'package:portfolio/Widgets/Portfilio/profile_image.dart';

class BasicDataWidget extends StatelessWidget {
  final ProfileEntity? profile;
  final double size, height;

  const BasicDataWidget({
    super.key,
    this.size = 100,
    required this.profile,
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AnimatedBackground(
        height: height,
        child: Container(
          padding:
              const EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 20),
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: colors.surface,
            boxShadow: [
              BoxShadow(
                  color: colors.accentSoft.withValues(alpha: 0.8),
                  blurRadius: 10,
                  spreadRadius: 10,
                  offset: Offset(0, 0))
            ],
            border: Border.all(color: colors.text3, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(cardRadius)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileImage(
                width: size,
                height: size,
                image: profile?.image ?? "",
              ),
              const SizedBox(height: 16),
              Text(
                "${profile?.firstName ?? ""}${profile?.lastName ?? ""}",
                style: AppTextStyles.basicDataTitle(
                  context: context,
                  color: colors.text1,
                ),
              ),
              Text(
                (profile?.jobTitle ?? "").toUpperCase(),
                style: AppTextStyles.basicDataSubTitle(
                  context: context,
                  color: colors.accent,
                ),
              ),
              const SizedBox(height: 8),
              BasicDataItem(
                title: 'Based In',
                value: profile?.location ?? "",
              ),
              const SizedBox(height: 8),
              BasicDataItem(
                title: 'Currently',
                value: profile?.currentCompany ?? "",
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 16,
                children: [
                  CustomHireButton(
                    email: profile?.email,
                  ),
                  const CustomResumeButton(),
                ],
              )
            ],
          ),
        ));
  }
}

class BasicDataItem extends StatelessWidget {
  final String title, value;
  const BasicDataItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Text(
          title.toUpperCase(),
          style: AppTextStyles.basicDataLabelName(
            context: context,
            color: colors.text2,
          ),
        ).expand,
        Text(
          value,
          style: AppTextStyles.basicDataLabelValue(
            context: context,
            color: colors.text1,
          ),
        ).expandFlex(3),
      ],
    );
  }
}
