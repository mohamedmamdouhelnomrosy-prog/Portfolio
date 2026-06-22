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
import '../../../home/presentation/cubit/cubit.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/";

  const SplashScreen({
    super.key,
  });

  @override
  createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Future<void> getData() async {
    await context.read<PortfolioCubit>().getData();
  }

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
    return BlocListener<PortfolioCubit, PortfolioState>(
        listener: (c, state) {
          if (state.loading == RequestStatus.success)
            context.goNamed(HomeView.routeName);
        },
        listenWhen: (p, n) => p.loading != n.loading,
        child: Scaffold(
          backgroundColor: colors.background,
          body: Stack(
            children: [
              AnimatedBuilder(
                animation: _particleController,
                builder: (_, __) {
                  return CustomPaint(
                    painter: ParticlePainter(
                      particles: _particles,
                      color: colors.secondary,
                      progress: _particleController.value,
                    ),
                    child: const SizedBox.expand(),
                  );
                },
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProfileImage(image: Assets.images.logo.path,),
                    24.0.heightBox,
                    const LoadingTextWidget()
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
