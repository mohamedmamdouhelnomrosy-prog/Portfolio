import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int targetNumber;
  final String? subtitle;
  final Duration duration;
  final TextStyle? style;

  const AnimatedCounter({
    super.key,
    required this.targetNumber,
    this.duration = const Duration(milliseconds: 1500),
    this.style, this.subtitle,
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.targetNumber.toDouble(),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, // بيبدأ سريع وبيتباطأ في الآخر
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, __) => Text(
        "${_animation.value.toInt()} ${widget.subtitle??""}",
        style: widget.style,
      ),
    );
  }
}