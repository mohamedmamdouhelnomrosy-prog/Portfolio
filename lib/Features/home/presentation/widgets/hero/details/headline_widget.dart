import 'package:flutter/cupertino.dart';
import 'package:portfolio/Features/home/presentation/widgets/hero/details/titles.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({super.key});

  static const _duration = Duration(milliseconds: 550);

  @override
  Widget build(BuildContext context) {
    return const SliverMainAxisGroup(
      slivers: [
        MainTitle(duration: _duration),
        SecondaryTitle(duration: _duration),
        SliverToBoxAdapter(child: SizedBox(height: 8)),
        JobTitle(duration: _duration),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        HeroSummaryWidget(duration: _duration),
      ],
    );
  }
}
