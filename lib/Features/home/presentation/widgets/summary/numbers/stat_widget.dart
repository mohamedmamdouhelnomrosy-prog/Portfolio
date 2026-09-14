// ──────────────────────────────────────────
//  STATS ROW
// ──────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Portfilio/animated_list.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Utilities/extensions.dart';
import '../../../../../../Widgets/Custom/animated_counter.dart';

class StatsWidget extends StatelessWidget {
  final List<Stat> items;
  const StatsWidget({
    super.key,
    this.items = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGridView(
      perRow: 2,
      items: items,
      hozSpace: 0,
      vertSpace: 0,
      getKey: (i) => ValueKey('State$i'),
      mainAxisExtent: 140,
      buildChild: (index) => StatItem(item: items[index]),
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

    return AnimatedPostionedCardWidget(
        width: double.infinity,
        paddingHoz: 24,
        paddingVert: 24,
        cardColor: colors.background,
        child: (h) => Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name?.toUpperCase() ?? "",
                  style: AppTextStyles.summaryNumberMedium(
                      context: context, color: colors.secondary),
                ),
                AnimatedCounter(
                  targetNumber: item.value ?? 0,
                  subtitle: item.label,
                  decimalPlaces: item.decimalPlaces,
                  style: AppTextStyles.summaryNumberLarge(
                      context: context, color: colors.text1),
                ),
                Text(
                  item.subTitle ?? "",
                  style: AppTextStyles.label(
                      context: context, color: colors.text2),
                ),
              ],
            ));
  }
}

class Stat {
  final String? name;
  final String? label;
  final String? subTitle;
  final double? value;
  final int? decimalPlaces;
  const Stat(
      {this.name, this.decimalPlaces, this.label, this.value, this.subTitle});
}
