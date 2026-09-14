import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';

class AnimatedPostionedCardWidget extends StatelessWidget {
  final Color? cardColor, borderColor, shadowColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;
  final double? width, height;

  const AnimatedPostionedCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = cardRadius,
    this.shadowColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InteractiveCard(
      child: (_isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: width,
        height: height,
        transform: Matrix4.translationValues(
          0,
          _isHovered ? -3 : 0,
          0,
        ),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(border),
          ),
          border: Border.all(
            color: _isHovered ? colors.accent : (borderColor ?? colors.border),
            width: 0.2,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? colors.border : Colors.transparent,
              spreadRadius: _isHovered ? 2 : 0,
              blurRadius: _isHovered ? 4 : 0,
              offset: const Offset(0, 4),
            ),
          ],
          color: (cardColor ?? colors.surface),
        ),
        padding:
            EdgeInsets.symmetric(horizontal: paddingHoz, vertical: paddingVert),
        child: child(_isHovered),
      ),
    );
  }
}

class AnimatedCardWidget extends StatelessWidget {
  final Color? cardColor, borderColor, shadowColor;
  final Widget Function(bool hover) child;
  final double paddingHoz, paddingVert, border;
  final double? width, height;

  const AnimatedCardWidget({
    super.key,
    this.cardColor,
    this.borderColor,
    required this.child,
    this.paddingHoz = 16,
    this.paddingVert = 12,
    this.width,
    this.border = cardRadius,
    this.shadowColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InteractiveCard(
        child: (h) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: width,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(border),
                ),
                border: Border.all(
                  color: (borderColor ?? colors.border),
                  width: 0.2,
                ),
                boxShadow: h
                    ? [
                        BoxShadow(
                            color: colors.border,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: const Offset(0, 4))
                      ]
                    : null,
                color: (cardColor ?? colors.background),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: paddingHoz, vertical: paddingVert),
              child: child(h),
            ));
  }
}

class SideAnimatedCard extends StatefulWidget {
  final Widget child;
  final double? width;

  const SideAnimatedCard({
    super.key,
    this.width,
    required this.child,
  });

  @override
  State<SideAnimatedCard> createState() => _SideAnimatedCardState();
}

class _SideAnimatedCardState extends State<SideAnimatedCard> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InteractiveCard(
      child: (h) => AnimatedContainer(
        width: widget.width,
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          border: Border.all(
            color: h ? colors.accent : colors.border,
            width: h ? 1 : 0.4,
          ),
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        padding: const EdgeInsets.all(16),
        child: widget.child,
      ),
    );
  }
}

class InteractiveCard extends StatefulWidget {
  final Widget Function(bool) child;

  const InteractiveCard({
    super.key,
    required this.child,
  });

  @override
  State<InteractiveCard> createState() => _InteractiveCardState();
}

class _InteractiveCardState extends State<InteractiveCard> {
  bool _hovered = false;
  bool _pressed = false;

  bool get _isDesktop =>
      Theme.of(context).platform == TargetPlatform.macOS ||
      Theme.of(context).platform == TargetPlatform.windows ||
      Theme.of(context).platform == TargetPlatform.linux;

  void _setHover(bool value) {
    if (_isDesktop) {
      setState(() => _hovered = value);
    }
  }

  void _setPressed(bool value) {
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    if (_isDesktop) {
      return MouseRegion(
        onEnter: (_) => _setHover(true),
        onExit: (_) => _setHover(false),
        child: widget.child(_hovered),
      );
    }

    return GestureDetector(
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: widget.child(_pressed),
    );
  }
}

class AnimatedDot extends StatefulWidget {
  final bool active;

  const AnimatedDot({
    super.key,
    required this.active,
  });

  @override
  State<AnimatedDot> createState() => _AnimatedDotState();
}

class _AnimatedDotState extends State<AnimatedDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scale = Tween<double>(
      begin: 0.8,
      end: 1.3,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacity = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    if (widget.active) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedDot oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.active != oldWidget.active) {
      if (widget.active) {
        _controller.repeat(reverse: true);
      } else {
        _controller.stop();
        _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 400),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.active ? _scale.value : 0.8,
          child: Opacity(
            opacity: widget.active ? _opacity.value : 0.3,
            child: child,
          ),
        );
      },
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: colors.secondary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
