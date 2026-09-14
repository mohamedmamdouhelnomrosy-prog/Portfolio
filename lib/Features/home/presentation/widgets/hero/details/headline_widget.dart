import 'package:flutter/cupertino.dart';
import 'package:portfolio/Features/home/presentation/widgets/hero/details/titles.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({super.key});

  final duration = const Duration(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        MainTitle(
          duration: duration,
          delay: duration * 0,
        ),
        SecondaryTitle(
          duration: duration,
          delay: duration * 1,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        JobTitle(
          duration: duration,
          delay: duration * 2,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        HeroSummaryWidget(
          duration: duration,
          delay: duration * 3,
        ),
      ],
    );
  }
}
