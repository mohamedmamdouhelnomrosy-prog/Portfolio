import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/hire_me_button.dart';
import 'package:portfolio/Widgets/Buttons/resume_button.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Portfilio/animated_background.dart';
import 'package:portfolio/Widgets/Portfilio/profile_image.dart';

class BasicDataWidget extends StatelessWidget {
  final double size, height;

  const BasicDataWidget({
    super.key,
    this.size = 100,
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

    return InteractiveCard(
      child: (hover) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -40,
            left: 0,
            right: 0,
            height: widget.height * 1.2,
            child: Center(
              child: Transform.rotate(
                angle: -0.6,
                child: Container(
                  width: widget.height * 1.2,
                  height: widget.height * 2,
                  decoration: BoxDecoration(
                    color: colors.accentSoft,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(cardRadius)),
                  ),
                ),
              )
                  .animate(target: hover ? 1 : 0)
                  .fadeIn(
                    delay: 180.ms,
                    duration: 350.ms,
                    curve: Curves.easeOut,
                  )
                  .scale(
                    begin: const Offset(0.4, 0.4),
                    end: const Offset(1, 1),
                    delay: 180.ms,
                    duration: 350.ms,
                    curve: Curves.easeOutBack,
                  )
                  .slide(
                    begin: const Offset(0, -0.3),
                    end: Offset.zero,
                    delay: 180.ms,
                    duration: 350.ms,
                    curve: Curves.easeOut,
                  ),
            ),
          ),
          AnimatedContainer(
            duration: 250.ms,
            curve: Curves.easeOut,
            padding: const EdgeInsetsGeometry.symmetric(
                horizontal: 24, vertical: 20),
            margin: EdgeInsetsGeometry.symmetric(
                horizontal: context.isLarge ? 100 : 0, vertical: 0),
            width: double.infinity,
            height: widget.height,
            transform: Matrix4.translationValues(0, hover ? -6 : 0, 0),
            decoration: BoxDecoration(
              color: colors.surface,
              boxShadow: [
                BoxShadow(
                  color: colors.accentSoft.withValues(alpha: hover ? 1.0 : 0.8),
                  blurRadius: hover ? 22 : 10,
                  spreadRadius: hover ? 4 : 10,
                  offset: const Offset(0, 0),
                ),
              ],
              border: Border.all(
                color: hover ? colors.accent : colors.text3,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(cardRadius)),
            ),
            child: BlocSelector<PortfolioCubit, PortfolioState, ProfileEntity?>(
                selector: (state) => state.data?.profile,
                builder: (context, profile) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileImage(
                        width: widget.size,
                        height: widget.size,
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
                          CustomHireButton(email: profile?.email),
                          const CustomResumeButton(),
                        ],
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
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
