import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/sections.dart';

import '../../Utilities/Constants/constants.dart';
import '../../Utilities/extensions.dart';
import '../Buttons/theme_button.dart';
import 'menu_button_item.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({
    super.key,
  });

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _fadeAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
    _scaleAnim = Tween<double>(begin: 0.95, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));

    _ctrl.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() => _isOpen = false);
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_isOpen) {
      _ctrl.reverse();
    } else {
      setState(() => _isOpen = true);
      _ctrl.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── AppBar ──
          Container(
            height: 64,
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: mobileHozPadding),
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: colors.text3, width: 1),
            ),
            child: AnimationLimiter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 400),
                  delay: const Duration(milliseconds: 100),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 24.0,
                    child: FadeInAnimation(child: widget),
                  ),
                  children: [
                    HamburgerBtn(
                      isOpen: _isOpen,
                      onTap: _toggle,
                    ),
                    const TestThemeToggleButton(),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            top: 64,
            child: FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                alignment: Alignment.topCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.surface,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    spacing: 12,
                    children: SectionModel.paths
                        .map((e) => SectionsWidget(section: e))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
