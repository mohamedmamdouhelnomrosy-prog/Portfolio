import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/Features/Splash/presentation/widgets/splash_background.dart';

import '../../../../Utilities/extensions.dart';

class BasicAnimatedBackground extends StatefulWidget {
  final Widget? child;
  final double height;
  final double? width;
  const BasicAnimatedBackground({
    super.key,
    this.child,
    this.width,
    required this.height,
  });

  @override
  createState() => _BasicAnimatedBackgroundState();
}

class _BasicAnimatedBackgroundState extends State<BasicAnimatedBackground>
    with TickerProviderStateMixin {
  // Particles
  late AnimationController _particleController;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initParticles();
    _initAnimations();
  }

  void _initParticles() {
    for (int i = 0; i < 60; i++) {
      _particles.add(Particle(random: _random));
    }
  }

  void _initAnimations() {
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          height: widget.height,
          width: widget.width ?? double.infinity,
          color: colors.surface,
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 360,
            height: 360,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  colors.accent.withValues(alpha: 0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -8,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  colors.accent.withValues(alpha: 0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            bottom: -100,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      colors.text3.withValues(alpha: 0.02),
                      colors.surface,
                    ],
                  )),
            )),
        AnimatedBuilder(
          animation: _particleController,
          builder: (_, __) {
            return CustomPaint(
              painter: ParticlePainter(
                  particles: _particles,
                  color: colors.accent,
                  progress: _particleController.value),
              child: SizedBox(
                height: widget.height,
                width: double.infinity,
              ),
            );
          },
        ),
        if (widget.child != null) widget.child!
      ],
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  final Widget? child;
  final double height;
  const AnimatedBackground({super.key, this.child, required this.height});

  @override
  createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  // Particles
  late AnimationController _particleController;
  final List<Particle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initParticles();
    _initAnimations();
  }

  void _initParticles() {
    for (int i = 0; i < 60; i++) {
      _particles.add(Particle(random: _random));
    }
  }

  void _initAnimations() {
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  @override
  void dispose() {
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        AnimatedBuilder(
          animation: _particleController,
          builder: (_, __) {
            return CustomPaint(
              painter: ParticlePainter(
                  particles: _particles,
                  color: colors.accent,
                  progress: _particleController.value),
              child: SizedBox(
                height: widget.height,
                width: double.infinity,
              ),
            );
          },
        ),
        widget.child == null ? SizedBox.shrink() : widget.child!,
      ],
    );
  }
}
