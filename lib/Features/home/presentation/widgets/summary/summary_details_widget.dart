import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/hero/details/titles.dart';
import 'package:portfolio/Features/home/presentation/widgets/summary/numbers/stat_widget.dart';
import 'package:portfolio/Utilities/extensions.dart';

class SummaryDetailsWidget extends StatelessWidget {
  const SummaryDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (context.isLarge) {
      return SliverCrossAxisGroup(
        slivers: [
          const SliverCrossAxisExpanded(
            flex: 3,
            sliver: SummaryWidget(
              duration: Duration(milliseconds: 500),
            ),
          ),
          const SliverCrossAxisExpanded(
              flex: 1,
              sliver: SliverToBoxAdapter(child: SizedBox(height: 16.0))),
          SliverCrossAxisExpanded(flex: 2, sliver: stats()),
        ],
      );
    }
    return SliverMainAxisGroup(
      slivers: [
        const SummaryWidget(
          duration: Duration(milliseconds: 500),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16.0)),
        stats(),
      ],
    );
  }

  Widget stats() => BlocBuilder<PortfolioCubit, PortfolioState>(
      buildWhen: (c, p) => c.data != p.data,
      builder: (context, state) {
        final projectsNumber = state.projectLen;
        final certNumber = state.certificationLen;
        final rolesNum = state.data?.experience.length ?? 0;
        final experience = state.data?.profile?.experience;
        final auto =
            state.data?.projects.where((e) => e.isManual == false).length ?? 0;
        final manual = projectsNumber - auto;
        return StatsWidget(
          items: [
            Stat(
                value: experience,
                name: 'Experience',
                label: '+ years',
                subTitle: '${rolesNum} roles'),
            Stat(
                value: projectsNumber.toDouble(),
                name: 'Projects Tested',
                subTitle: '${manual} manual . $auto automation '),
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
