import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Utilities/Constants/date_helper.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';
import 'package:portfolio/Widgets/Portfilio/point_text.dart';

import '../../../../../Core/Language/app_styles.dart';

class ExperienceItemCard extends StatelessWidget {
  final ExperienceEntity? item;

  const ExperienceItemCard({
    super.key,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isActive = item?.status ?? false;

    return SideAnimatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item?.companyName ?? "",
                      style: AppTextStyles.titleCardLarge(
                          context: context, color: colors.secondary)),
                  const SizedBox(height: 4),
                  Text(item?.jobTitle ?? "",
                      style: AppTextStyles.label(
                          context: context, color: colors.text1))
                ],
              ).expand,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: !isActive
                      ? colors.secondary25.withOpacity(0.2)
                      : colors.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${item?.startDate == null ? "" : mmYYYY(item!.startDate!)} - ${(item?.endDate == null ? "Present" : mmYYYY(item!.endDate!))}",
                  style:
                      (AppTextStyles.titleCardSmall(context: context)).copyWith(
                    color: isActive ? colors.secondary : colors.secondary50,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...List.generate(
              item?.responsibilities.length ?? 0,
              (i) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PointText(
                          point: (item?.responsibilities[i] ?? ""),
                          style: AppTextStyles.body(
                              context: context, color: colors.text2)),
                      if (i < (item?.responsibilities.length ?? 0) - 1)
                        const DividerWidget(thickness: 0.6)
                    ],
                  )),
        ],
      ),
    );
  }
}

// ─── Experience Card ──────────────────────────────────────────────────────────

class ExperienceCard extends StatefulWidget {
  final ExperienceEntity experience;
  final bool initiallyExpanded;

  const ExperienceCard({
    super.key,
    required this.experience,
    this.initiallyExpanded = false,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard>
    with SingleTickerProviderStateMixin {
  late bool _expanded;
  late AnimationController _controller;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: _expanded ? 1.0 : 0.0,
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    _expanded ? _controller.forward() : _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SideAnimatedCard(
      child: Column(
        children: [
          // ── Header ──
          GestureDetector(
            onTap: _toggle,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          if (widget.experience.status)
                            const AnimatedDot(
                              active: true,
                            ),
                          Text(widget.experience.companyName ?? "",
                                  maxLines: 2,
                                  style: AppTextStyles.titleCardLarge(
                                      context: context, color: colors.text1))
                              .expand,
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(widget.experience.jobTitle ?? "",
                          style: AppTextStyles.label(
                              context: context, color: colors.secondary50)),
                    ],
                  ),
                ),

                // Period badge + chevron
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: widget.experience.status == true
                            ? colors.secondary25
                            : colors.border.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${widget.experience.startDate == null ? "" : mmYYYY(widget.experience.startDate!)} - ${(widget.experience.endDate == null ? "Present" : mmYYYY(widget.experience.endDate!))}",
                        style: (AppTextStyles.titleCardSmall(context: context))
                            .copyWith(
                          color: widget.experience.status == true
                              ? colors.secondary
                              : colors.text2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: colors.text2,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          16.0.heightBox,
          // ── Expandable bullet points ──
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                ...List.generate(
                    widget.experience.responsibilities.length,
                    (i) => Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PointText(
                                point: (widget.experience.responsibilities[i] ??
                                    ""),
                                style: AppTextStyles.body(
                                    context: context, color: colors.text2)),
                            if (i <
                                (widget.experience.responsibilities.length ??
                                        0) -
                                    1)
                              const DividerWidget(thickness: 0.6)
                          ],
                        ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
