import 'package:flutter/material.dart';

import '../../../Utilities/extensions.dart';
import '../../../Utilities/portifilo_icons.dart';

class HamburgerBtn extends StatelessWidget {
  final bool isOpen;
  final Function() onTap;

  const HamburgerBtn({required this.isOpen, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 220),
        child: Icon(isOpen ? Portfolio.close : Icons.menu,
            key: ValueKey<bool>(isOpen), color: colors.accent, size: 24),
      ),
    );
  }
}
