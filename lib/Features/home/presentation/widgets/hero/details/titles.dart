import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

class MainTitle extends StatelessWidget {
  final Duration duration;
  const MainTitle({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SliverToBoxAdapter(
        child: BlocSelector<PortfolioCubit, PortfolioState, ProfileEntity?>(
      selector: (state) => state.data?.profile,
      builder: (c, profile) => Text(
        "${profile?.firstName ?? ""}",
        style: AppTextStyles.headline(
          context: context,
          color: colors.text1,
        ),
      ).animate().fadeIn(duration: duration, curve: Curves.easeOutCubic).slideX(
            begin: -0.15,
            end: 0,
            duration: duration,
            curve: Curves.easeOutCubic,
          ),
    ));
  }
}

class SecondaryTitle extends StatelessWidget {
  final Duration duration;
  const SecondaryTitle({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SliverToBoxAdapter(
        child: BlocSelector<PortfolioCubit, PortfolioState, ProfileEntity?>(
            selector: (state) => state.data?.profile,
            builder: (c, profile) => Text(
                  "${profile?.lastName ?? ""}",
                  style: AppTextStyles.headline(
                    context: context,
                    color: colors.text1,
                  ),
                )
                    .animate(delay: 200.ms)
                    .fadeIn(duration: duration, curve: Curves.easeOutCubic)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1, 1),
                      duration: duration,
                      curve: Curves.easeOutBack,
                    )
                    .blurXY(
                      begin: 6,
                      end: 0,
                      duration: duration,
                      curve: Curves.easeOut,
                    )));
  }
}

class JobTitle extends StatelessWidget {
  final Duration duration;
  const JobTitle({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SliverToBoxAdapter(
        child: BlocSelector<PortfolioCubit, PortfolioState, ProfileEntity?>(
            selector: (state) => state.data?.profile,
            builder: (c, profile) => Row(
                  spacing: 8,
                  children: [
                    Text(
                      (profile?.jobTitle ?? "").toUpperCase(),
                      style: AppTextStyles.basicDataSubTitle(
                        context: context,
                        color: colors.secondary,
                      ),
                    ),
                    Icon(
                      Portfolio.magniferBug,
                      color: colors.secondary,
                    ),
                  ],
                )
                    .animate(delay: 200.ms)
                    .fadeIn(duration: duration, curve: Curves.easeOutCubic)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1, 1),
                      duration: duration,
                      curve: Curves.easeOutBack,
                    )
                    .blurXY(
                      begin: 6,
                      end: 0,
                      duration: duration,
                      curve: Curves.easeOut,
                    )));
  }
}

class HeroSummaryWidget extends StatelessWidget {
  final Duration duration;
  const HeroSummaryWidget({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SliverToBoxAdapter(
      child: BlocSelector<PortfolioCubit, PortfolioState, String>(
        selector: (state) => state.data?.profile?.shortSummary ?? "",
        builder: (context, summary) {
          return Text(
            summary,
            style: AppTextStyles.summaryBody(
              context: context,
              color: colors.text2,
            ),
          )
              .animate(delay: 450.ms)
              .fadeIn(duration: duration, curve: Curves.easeOut)
              .blurXY(
                begin: 8,
                end: 0,
                duration: duration,
                curve: Curves.easeOut,
              );
        },
      ),
    );
  }
}

class SummaryWidget extends StatelessWidget {
  final Duration duration;
  const SummaryWidget({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SliverToBoxAdapter(
      child: BlocSelector<PortfolioCubit, PortfolioState, String>(
        selector: (state) => state.data?.profile?.summary ?? "",
        builder: (context, summary) {
          return Text(
            summary,
            style: AppTextStyles.summaryBody(
              context: context,
              color: colors.text2,
            ),
          )
              .animate(delay: 450.ms)
              .fadeIn(duration: duration, curve: Curves.easeOut)
              .blurXY(
                begin: 8,
                end: 0,
                duration: duration,
                curve: Curves.easeOut,
              );
        },
      ),
    );
  }
}
