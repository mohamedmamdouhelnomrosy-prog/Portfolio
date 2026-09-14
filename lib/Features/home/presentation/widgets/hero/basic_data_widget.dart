import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/hire_me_button.dart';
import 'package:portfolio/Widgets/Buttons/resume_button.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';
import 'package:portfolio/Widgets/Portfilio/profile_image.dart';

class BasicDataWidget extends StatelessWidget {
  final double size, height;

  const BasicDataWidget({
    super.key,
    this.size = 140,
    this.height = 400,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedBackground(
          height: height,
          child: ProfileHeroCard(
            size: size,
            height: height,
          )),
    );
  }
}

class ProfileHeroCard extends StatefulWidget {
  final double size, height;
  const ProfileHeroCard({super.key, required this.size, required this.height});

  @override
  State<ProfileHeroCard> createState() => _ProfileHeroCardState();
}

class _ProfileHeroCardState extends State<ProfileHeroCard> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 40),
      margin: EdgeInsetsDirectional.only(
        start: context.isLarge ? 100 : 0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.background,
        gradient: LinearGradient(colors: [
          colors.accentSoft.withValues(alpha: 0.4),
          colors.accentSoft.withValues(alpha: 0.3),
          colors.accentSoft.withValues(alpha: 0.2),
          colors.accentSoft.withValues(alpha: 0.5),
        ]),
        border: Border.all(
          color: colors.border,
          width: 0.2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(cardRadius)),
      ),
      child: BlocSelector<PortfolioCubit, PortfolioState, ProfileEntity?>(
          selector: (state) => state.data?.profile,
          builder: (context, profile) {
            return Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileImage(
                  width: widget.size,
                  height: widget.size,
                  image: profile?.image ?? "",
                ),
                const SizedBox(height: 8),
                const DividerWidget(),
                const SizedBox(height: 8),
                BasicDataItem(
                  title: 'Based In',
                  value: profile?.location ?? "",
                ),
                BasicDataItem(
                  title: 'Currently',
                  value: profile?.currentCompany ?? "",
                ),
                const SizedBox(height: 8),
                const DividerWidget(),
                const SizedBox(height: 8),
                Row(
                  spacing: 16,
                  children: [
                    CustomHireButton(email: profile?.email).expand,
                    const CustomResumeButton().expand,
                  ],
                )
              ],
            );
          }),
    );
  }
}

class BasicDataItem extends StatelessWidget {
  final String title, value;
  const BasicDataItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTextStyles.basicDataLabelName(
            context: context,
            color: colors.text3,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.basicDataLabelValue(
            context: context,
            color: colors.text1,
          ),
        ),
      ],
    );
  }
}
