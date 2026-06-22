import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';

import '../../../../Utilities/extensions.dart';

class LoadingTextWidget extends StatefulWidget {
  const LoadingTextWidget({
    super.key,
  });

  @override
  createState() => _LoadingTextWidgetState();
}

class _LoadingTextWidgetState extends State<LoadingTextWidget>
    with TickerProviderStateMixin {
  // Typewriter
  late AnimationController _typeController;
  final String _fullText = "Loading Portfolio...";
  int _visibleChars = 0;

  // Fade للـ loading indicator
  late AnimationController _fadeController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _typeController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: _fullText.length * 80),
    );

    _typeController.addListener(() {
      final newCount = (_typeController.value * _fullText.length).floor().clamp(
            0,
            _fullText.length,
          );
      if (newCount != _visibleChars) {
        setState(() => _visibleChars = newCount);
      }
    });

    _typeController.forward();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeAnim = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _typeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeController.forward();
      }
    });
  }

  @override
  void dispose() {
    _typeController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _fullText.substring(0, _visibleChars),
          style: AppTextStyles.title(context: context).copyWith(
            color: colors.text1,
            fontWeight: FontWeight.w300,
            letterSpacing: 4,
          ),
        ),
        const SizedBox(height: 20),
        FadeTransition(
          opacity: _fadeAnim,
          child: SizedBox(
            width: 200,
            child: LinearProgressIndicator(
              backgroundColor: colors.text3,
              borderRadius: BorderRadius.circular(8),
              valueColor: AlwaysStoppedAnimation<Color>(
                colors.secondary.withValues(alpha: 0.7),
              ),
            ),
          ),
        )
      ],
    );
  }
}
