import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/Utilities/animation_configaration.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final double offset;
  final Axis axis;
  final int? index;
  final Duration staggerStep;
  final double visibilityThreshold;

  const ScrollReveal({
    super.key,
    required this.child,
    this.offset = 20,
    this.axis = Axis.vertical,
    this.index,
    this.staggerStep = const Duration(milliseconds: 80),
    this.visibilityThreshold = 0.15,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  AnimationController? _controller;
  bool _hasAnimated = false;
  late final Key _fallbackKey = UniqueKey(); // يتولد مرة واحدة بس

  void _handleVisibility(VisibilityInfo info) {
    if (_hasAnimated) return;
    if (info.visibleFraction < widget.visibilityThreshold) return;

    _hasAnimated = true;

    final delay = widget.index != null
        ? widget.staggerStep * widget.index!
        : Duration.zero;

    Future.delayed(delay, () {
      if (mounted) _controller?.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    final duration = PortfolioAnimationConfig.duration(context);
    final slideOffset = widget.offset / 100;

    return VisibilityDetector(
      key: widget.key ?? _fallbackKey, // مستقر عبر الـ rebuilds
      onVisibilityChanged: _handleVisibility,
      child: widget.child
          .animate(
            autoPlay: false,
            onInit: (controller) => _controller = controller,
          )
          .fadeIn(duration: duration, curve: Curves.easeOutCubic)
          .slide(
            begin: widget.axis == Axis.vertical
                ? Offset(0, slideOffset)
                : Offset(slideOffset, 0),
            end: Offset.zero,
            duration: duration,
            curve: Curves.easeOutCubic,
          ),
    );
  }
}

class AnimatedGridView<T> extends StatelessWidget {
  final int perRow;
  final double hozSpace, vertSpace;
  final double mainAxisExtent;
  final List<T> items;
  final Widget Function(int) buildChild;

  const AnimatedGridView({
    super.key,
    required this.perRow,
    required this.mainAxisExtent,
    required this.items,
    this.hozSpace = 8,
    this.vertSpace = 8,
    required this.buildChild,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: perRow,
        mainAxisSpacing: vertSpace,
        crossAxisSpacing: hozSpace,
        mainAxisExtent: mainAxisExtent,
      ),
      itemCount: items.length,
      addRepaintBoundaries: true,
      itemBuilder: (context, index) {
        return ScrollReveal(
          offset: 20,
          axis: Axis.vertical,
          index: index,
          child: buildChild(index),
        );
      },
    );
  }
}
