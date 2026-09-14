import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/hero/details/titles.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/numbers/stat_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';

class SummaryDetailsWidget extends StatelessWidget {
  const SummaryDetailsWidget({super.key});

  static const _duration = Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    if (context.isLarge) {
      // في الشاشة الكبيرة الاتنين جنب بعض، فلو عايزهم ورا بعض
      // خلي stats يبدأ بعد ما SummaryWidget يخلص
      return SliverCrossAxisGroup(
        slivers: [
          const SliverCrossAxisExpanded(
            flex: 3,
            sliver: SummaryWidget(
              duration: _duration,
              delay: Duration.zero,
            ),
          ),
          const SliverCrossAxisExpanded(
              flex: 1,
              sliver: SliverToBoxAdapter(child: SizedBox(height: 16.0))),
          SliverCrossAxisExpanded(
            flex: 2,
            sliver: stats(delay: _duration), // يبدأ بعد ما الملخص يخلص
          ),
        ],
      );
    }
    return SliverMainAxisGroup(
      slivers: [
        const SummaryWidget(
          duration: _duration,
          delay: Duration.zero,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
        stats(delay: _duration), // يبدأ بعد ما الملخص يخلص
      ],
    );
  }

  Widget stats({required Duration delay}) =>
      BlocBuilder<PortfolioCubit, PortfolioState>(
          buildWhen: (c, p) => c.data != p.data,
          builder: (context, state) {
            final projectsNumber = state.data?.projects.length ?? 0;
            final certNumber = state.data?.certificates.length ?? 0;
            final rolesNum = state.data?.experience.length ?? 0;
            final experience = state.data?.profile?.experience;
            final auto =
                state.data?.projects.where((e) => e.isManual == false).length ??
                    0;
            final manual = projectsNumber - auto;
            return StatsWidget(
              duration: _duration,
              delay: delay,
              items: [
                Stat(
                    value: experience,
                    name: 'Experience',
                    label: '+ years',
                    subTitle: '$rolesNum roles'),
                Stat(
                    value: projectsNumber.toDouble(),
                    name: 'Projects Tested',
                    subTitle: '$manual manual . $auto automation '),
                Stat(
                    value: certNumber.toDouble(),
                    name: 'Certifications',
                    subTitle: 'Certifications Completed'),
                const Stat(
                  value: 3.31,
                  label: '/4',
                  name: 'GPA',
                  decimalPlaces: 2,
                  subTitle: 'Graduation Project Grade (A)',
                ),
              ],
            );
          });
}
