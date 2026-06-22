import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Portfilio/divider.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Utilities/Constants/constants.dart';

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
    this.selected=false,
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
    final size =context.isLarge?lThemeButtonSize:context.isMedium?mThemeButtonSize:sThemeButtonSize;

    return InkWell(
      hoverColor: Colors.transparent,
      onTap: widget.onTap,

      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),



        child:
            Row(
              spacing: 4,
              children: [
                Icon(widget.icon,
                    size: size/2,  color:active?colors.secondary:colors.text2),
                if(context.isLarge)
                Text(
                  widget.title,

                  style: AppTextStyles.titleCardSmall(
                    context: context,
                      color:active?colors.secondary:colors.text2).copyWith(
                    height: 1.5,
                    decorationColor: colors.secondary,
                    decoration:active? TextDecoration.underline:null,
                    decorationThickness: 2
                  ),
                ),
              ],
            ),


      ),
    );
  }
}
