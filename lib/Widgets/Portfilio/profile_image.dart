import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../rounded_image_widget.dart';

class ProfileImage extends StatefulWidget {
  final String image;
  final double width, height;

  const ProfileImage({
    super.key,
    required this.image,
    this.width = 180,
    this.height = 180,
  });

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  bool _isHovered = false;

  void _onHoverChanged(bool value) {
    setState(() => _isHovered = value);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final glow = AnimatedContainer(
      height: widget.height,
      width: widget.width,
      duration: const Duration(microseconds: 500),
      decoration: BoxDecoration(
        color: colors.accent.withValues(alpha: 0.35),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: colors.accent.withValues(alpha: 0.08),
            blurRadius: 40,
            spreadRadius: 4,
          ),
        ],
      ),
    );

    return MouseRegion(
        onEnter: (_) => _onHoverChanged(true),
        onExit: (_) => _onHoverChanged(false),
        child: Stack(
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 250),
              scale: _isHovered ? 1.07 : 1,
              child: glow,
            ),
            RoundedImage(
              imagePath: widget.image,
              height: widget.height,
              width: widget.width,
              padding: 0,
              borderColor: colors.accent,
            )
          ],
        ));
  }
}
