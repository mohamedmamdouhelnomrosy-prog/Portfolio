import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/details/headline_widget.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/numbers/stat_widget.dart';

import '../../../../../../Utilities/Constants/constants.dart';

class SummaryDetailsWidget extends StatelessWidget {
  final double hozPadding;

  const SummaryDetailsWidget({
    super.key,
    this.hozPadding = desktopHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        const HeadlineWidget(),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        SliverToBoxAdapter(
            child: BlocBuilder<PortfolioCubit, PortfolioState>(
                buildWhen: (c, p) =>
                    c.data?.projects.length != p.data?.projects.length ||
                    c.data?.certificates.length != p.data?.certificates.length,
                builder: (context, state) {
                  final projectsNumber = context
                          .read<PortfolioCubit>()
                          .state
                          .data
                          ?.projects
                          .length ??
                      0;
                  final certNumber = context
                          .read<PortfolioCubit>()
                          .state
                          .data
                          ?.certificates
                          .length ??
                      0;
                  return StatsRow(
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
                  );
                }))
      ],
    );
  }
}
