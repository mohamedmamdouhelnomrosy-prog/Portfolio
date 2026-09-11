import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/extensions.dart';

class MainTitle extends StatelessWidget {
  final Duration duration;
  const MainTitle({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SliverToBoxAdapter(
      child: Text(
        'Ensuring Quality,',
        key: GlobalKeys.aboutMe,
        style: AppTextStyles.headline(context: context, color: colors.text1),
      ).animate().fadeIn(duration: duration, curve: Curves.easeOutCubic).slideX(
            begin: -0.15,
            end: 0,
            duration: duration,
            curve: Curves.easeOutCubic,
          ),
    );
  }
}

class SecondaryTitle extends StatelessWidget {
  final Duration duration;
  const SecondaryTitle({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SliverToBoxAdapter(
      child: ShaderMask(
        shaderCallback: (bounds) => LinearGradient(
          colors: [
            colors.accent,
            colors.accent,
            colors.accentSoft,
          ],
        ).createShader(bounds),
        child: Text(
          'One Test Case at a Time.',
          style: AppTextStyles.headline(context: context, color: colors.accent),
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
