import 'dart:math';

import 'package:flutter/material.dart';

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double progress;
  final Color color;
  final Random _random = Random();

  ParticlePainter(
      {required this.particles, required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in particles) {
      p.update(_random);

      final paint = Paint()
        ..color = color.withValues(alpha: p.opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);

      canvas.drawCircle(
        Offset(p.x * size.width, p.y * size.height),
        p.size,
        paint,
      );

      final linePaint = Paint()
        ..color = color.withValues(alpha: p.opacity * 0.3)
        ..strokeWidth = 0.5;

      canvas.drawLine(
        Offset(p.x * size.width, p.y * size.height),
        Offset(p.x * size.width, (p.y + 0.03) * size.height),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant ParticlePainter old) => true;
}

class Particle {
  late double x; // 0.0 → 1.0 نسبي
  late double y;
  late double speed;
  late double size;
  late double opacity;
  late double angle; // اتجاه الحركة

  Particle({required Random random}) {
    _reset(random, initial: true);
  }

  void _reset(Random random, {bool initial = false}) {
    x = random.nextDouble();
    y = initial ? random.nextDouble() : 1.1; // يبدأ من تحت
    speed = 0.0008 + random.nextDouble() * 0.0012;
    size = 1.0 + random.nextDouble() * 2.5;
    opacity = 0.1 + random.nextDouble() * 0.5;
    angle = (random.nextDouble() - 0.5) * 0.3; // انحراف بسيط
  }

  void update(Random random) {
    y -= speed;
    x += angle * 0.01;
    if (y < -0.05) _reset(random);
  }
}
