import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../../Core/Language/app_styles.dart';

class HomeAppBarItem extends StatefulWidget {
  final Function() onTap;
  final String title;
  final IconData icon;
  final bool selected;
  final TextStyle? titleStyle;

  const HomeAppBarItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.titleStyle,
    this.selected = false,
  });

  @override
  State<HomeAppBarItem> createState() => _HomeAppBarItemState();
}

class _HomeAppBarItemState extends State<HomeAppBarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    bool active = widget.selected || _isHovered;
    final padding = context.isLarge
        ? 40.0
        : context.isMedium
            ? 20.0
            : 0.0;

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 400),
            padding:
                const EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
                color: active ? colors.accentSoft : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child: Text(widget.title,
                style: AppTextStyles.appbarTitle(
                    context: context,
                    color: active ? colors.accent : colors.text2)),
          )),
    ).paddingOnly(end: padding);
  }
}
