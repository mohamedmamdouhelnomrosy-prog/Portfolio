import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/Features/Splash/presentation/widgets/loading_text_widget.dart';
import 'package:portfolio/Features/Splash/presentation/widgets/splash_background.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/pages/home_view.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Widgets/Portfilio/profile_image.dart';

import '../../../../Utilities/extensions.dart';
import '../../../../generated/assets.dart';

class AnimatedBackground extends StatefulWidget {
 final Widget? child;
 final double height;
  const AnimatedBackground({
    super.key, this.child, required this.height,
  });

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
    return  Stack(
      clipBehavior: Clip.hardEdge,
        children: [
          Container(height:widget.height ,width: double.infinity,color: colors.surface,),
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
    colors.secondary.withValues(alpha: 0.15),
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
                    colors.secondary.withValues(alpha: 0.1),
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
                      colors.border.withValues(alpha: 0.02),
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
                  color: colors.secondary,
                  progress: _particleController.value),
                  child:  SizedBox(height:widget.height ,width: double.infinity,),
                );
            },
              ),

          if(widget.child !=null)
            widget.child!


        ],
      );
  }
}
