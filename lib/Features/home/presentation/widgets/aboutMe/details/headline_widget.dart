import 'package:flutter/cupertino.dart';
import 'package:portfolio/Features/home/presentation/widgets/aboutMe/details/titles.dart';

class HeadlineWidget extends StatelessWidget {
  const HeadlineWidget({super.key});

  static const _duration = Duration(milliseconds: 550);

  @override
  Widget build(BuildContext context) {
    return const SliverMainAxisGroup(
      slivers: [
        MainTitle(duration: _duration),
        SecondaryTitle(duration: _duration),
        SummaryWidget(duration: _duration),
      ],
    );
  }
}
