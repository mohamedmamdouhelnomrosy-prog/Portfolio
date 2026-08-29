import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../Utilities/extensions.dart';

class CurvedCardWidget extends StatelessWidget {
  final Widget child;

  final void Function() onTap;

  const CurvedCardWidget({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return SizedBox(
      child: Stack(
        children: [
          CustomPaint(painter: CardCustomPainter(), child: child),
          Positioned(
            bottom: 0,
            right: 0,
            child: CustomButtonWidget(
              width: 60,
              height: 60,
              onPressed: onTap,
              borderRadiusValue: 100,
              btnColor: colors.accent,
              child: const Icon(
                Icons.north_east,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmoothNotchedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 30; // Corner radius
    double notchSize = 80; // Total area affected by the notch
    Path path = Path();

    path.moveTo(radius, 0);
    // Top Edge
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right Edge - Stop before the notch
    path.lineTo(size.width, size.height - notchSize - radius);

    // --- THE SMOOTH NOTCH ---
    // 1. Curve inward from the right wall
    path.quadraticBezierTo(size.width, size.height - notchSize,
        size.width - radius, size.height - notchSize);

    // 2. Curve downward toward the bottom wall
    path.quadraticBezierTo(size.width - notchSize, size.height - notchSize,
        size.width - notchSize, size.height - radius);

    // 3. Curve to finish the corner on the bottom edge
    path.quadraticBezierTo(size.width - notchSize, size.height,
        size.width - notchSize - radius, size.height);

    // Bottom Edge
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Left Edge
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CardCustomPainter extends CustomPainter {
  final Color color, borderColor;

  CardCustomPainter(
      {this.color = Colors.transparent, this.borderColor = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = borderColor.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5; // Slightly thicker for better visibility

    double radius = 30; // Corner radius
    double cutoutRadius = 92; // How "deep" the scoop is

    Path path = Path();

    // Start at top-left
    path.moveTo(radius, 0);

    // Top Edge
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    // Right Edge - Stop exactly where the notch starts curving IN
    path.lineTo(size.width, size.height - cutoutRadius - radius);

    // --- THE MAGIC CURVE ---
    // This creates the smooth transition into the notch
    path.quadraticBezierTo(size.width, size.height - cutoutRadius,
        size.width - radius, size.height - cutoutRadius);

    // This is the circular cutout (scoop)
    path.arcToPoint(
      Offset(size.width - cutoutRadius, size.height - radius),
      radius: Radius.circular(cutoutRadius),
      clockwise: false, // This makes it curve INWARD
    );

    // This creates the smooth transition out of the notch into the bottom edge
    path.quadraticBezierTo(size.width - cutoutRadius, size.height,
        size.width - cutoutRadius - radius, size.height);

    // Bottom Edge
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    // Left Edge
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);

    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
