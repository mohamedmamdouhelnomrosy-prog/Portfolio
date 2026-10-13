import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/experince_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/experince/content_item.dart';
import 'package:portfolio/Utilities/Constants/date_helper.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../../../../../Core/Language/app_styles.dart';

// ─── Experience Card ──────────────────────────────────────────────────────────

class ExperienceCard extends StatefulWidget {
  final ExperienceEntity experience;
  final bool initiallyExpanded, isLast;
  final int index;

  const ExperienceCard({
    super.key,
    required this.experience,
    required this.index,
    this.initiallyExpanded = false,
    this.isLast = false,
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
    return GestureDetector(
        onTap: _toggle,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                Text("0" + widget.index.toString(),
                    style: AppTextStyles.subtitleCard(
                        context: context, color: colors.secondary)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Header ──

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.experience.jobTitle ?? "",
                                maxLines: 2,
                                style: AppTextStyles.titleCardLarge(
                                    context: context, color: colors.text1))
                            .expand,
                        const SizedBox(width: 12),
                        AnimatedRotation(
                          turns: _expanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: colors.text3,
                            size: 22,
                          ),
                        ),
                      ],
                    ),

                    // Period badge + chevron
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Row(
                          children: [
                            Text("${widget.experience.companyName ?? ""}",
                                    style: AppTextStyles.subtitleCard(
                                        context: context, color: colors.text3))
                                .expand,
                            if (context.isLarge)
                              Text(" — ${widget.experience.location ?? ""}",
                                  style: AppTextStyles.subtitleCard(
                                      context: context, color: colors.text3))
                          ],
                        ).expand,
                        if (widget.experience.status)
                          const AnimatedDot(
                            active: true,
                          ),
                        Text(
                          "${widget.experience.startDate == null ? "" : mmYYYY(widget.experience.startDate!)} - ${(widget.experience.endDate == null ? "Present" : mmYYYY(widget.experience.endDate!))}",
                          style: AppTextStyles.titleCardSmall(
                            context: context,
                            color: widget.experience.status == true
                                ? colors.secondary
                                : colors.text3,
                          ),
                        ),
                      ],
                    ),
                    if (!context.isLarge) ...[
                      Text("${widget.experience.location ?? ""}",
                          style: AppTextStyles.subtitleCard(
                              context: context, color: colors.text3)),
                    ],

                    16.0.heightBox,
                    // ── Expandable bullet points ──
                    SizeTransition(
                      sizeFactor: _expandAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16,
                        children: [
                          ...widget.experience.content.map((i) => ContentItem(
                                item: i,
                              )),
                        ],
                      ),
                    ),
                  ],
                ).expand,
              ],
            ),
            if (!widget.isLast) const DividerWidget()
          ],
        ));
  }
}
