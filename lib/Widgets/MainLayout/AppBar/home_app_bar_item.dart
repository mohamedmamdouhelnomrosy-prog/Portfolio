import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Core/Language/app_styles.dart';

class MenuHomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final String? title;
  final IconData? icon;
  final bool selected;

  const MenuHomeAppBarItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.selected = false,
  });

  @override
  State<MenuHomeAppBarItem> createState() => _MenuHomeAppBarItemState();
}

class _MenuHomeAppBarItemState extends State<MenuHomeAppBarItem> {
  bool _isHovered = false;

  static const _duration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool active = widget.selected || _isHovered;
    final padding = context.isLarge
        ? 40.0
        : context.isMedium
            ? 20.0
            : 0.0;

    final showIcon = widget.icon != null && (widget.selected);
    final color = active ? colors.secondary : colors.text2;

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: _duration,
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(
              color: active ? colors.secondary : Colors.transparent,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSize(
                duration: _duration,
                curve: Curves.easeOut,
                child: AnimatedSwitcher(
                  duration: _duration,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(scale: animation, child: child),
                  ),
                  child: showIcon
                      ? Padding(
                          key: const ValueKey('icon'),
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(
                            widget.icon,
                            size: 18,
                            color: color,
                          ),
                        )
                      : const SizedBox(key: ValueKey('no-icon')),
                ),
              ),
              AnimatedDefaultTextStyle(
                duration: _duration,
                curve: Curves.easeOut,
                style: AppTextStyles.appbarTitle(
                  context: context,
                  color: color,
                ),
                child: Text(widget.title?.translate ?? ""),
              ),
            ],
          ),
        ),
      ),
    ).paddingOnly(end: padding);
  }
}

class HomeNavigatorItem extends StatefulWidget {
  final Function() onTap;
  final String? title;
  final IconData? icon;
  final bool selected;

  const HomeNavigatorItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.selected = false,
  });

  @override
  State<HomeNavigatorItem> createState() => _HomeNavigatorItemState();
}

class _HomeNavigatorItemState extends State<HomeNavigatorItem> {
  bool _isHovered = false;

  static const _duration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool active = widget.selected || _isHovered;
    final iconColor = active ? colors.secondarySoft : colors.text2;

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
            duration: _duration,
            curve: Curves.easeOut,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? colors.secondary : Colors.transparent,
            ),
            child: Icon(
              widget.icon,
              size: 20,
              color: iconColor,
            )),
      ),
    );
  }
}
