// ──────────────────────────────────────────
//  STATS ROW
// ──────────────────────────────────────────
import 'package:flutter/material.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Utilities/extensions.dart';
import '../../../../../../Widgets/Custom/animated_counter.dart';

class StatsRow extends StatelessWidget {
  final List<Stat> items;
  const StatsRow({
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      runSpacing: 20,
      children: items
          .map((s) => StatItem(
                item: s,
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

  const StatItem({
    required this.item,
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
            colors: [colors.accent, colors.accentSoft],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: AnimatedCounter(
            targetNumber: item.value ?? 0,
            subtitle: item.subTitle,
            style: AppTextStyles.summaryNumberLarge(
                context: context, color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          item.name?.toUpperCase() ?? "",
          style: AppTextStyles.summaryNumberMedium(
              context: context, color: colors.text2),
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
