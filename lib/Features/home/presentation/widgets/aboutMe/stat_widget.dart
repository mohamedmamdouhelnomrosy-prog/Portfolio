
// ──────────────────────────────────────────
//  STATS ROW
// ──────────────────────────────────────────
import 'package:flutter/material.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/Custom/animated_counter.dart';

class StatsRow extends StatelessWidget {
  final List<Stat> items;
  final TextStyle? numStyle , titleStyle;
  const StatsRow({this.items = const [], this.numStyle, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      runSpacing: 20,
      children: items
          .map((s) => StatItem(
        item: s,
        titleStyle: titleStyle,
        numStyle: numStyle,
      ))
          .toList(),
    );
  }
}

// ──────────────────────────────────────────
//  SINGLE STAT
// ──────────────────────────────────────────
class StatItem extends StatelessWidget {
  final Stat item;
  final TextStyle? numStyle , titleStyle;

  const StatItem({
    required this.item, this.numStyle, this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gradient number
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [colors.text1, colors.secondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: AnimatedCounter(
            targetNumber:  item.value??0,
            subtitle: item.subTitle,
            style:( numStyle?? AppTextStyles.medium32()).copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          item.name?.toUpperCase() ?? "",
          style:  (titleStyle??AppTextStyles.regular12()).copyWith(color: colors.text3),
        ),
      ],
    );
  }
}

class Stat {
  final String? name;
  final String? subTitle;
  final int? value;
  const Stat({this.name, this.value, this.subTitle});
}