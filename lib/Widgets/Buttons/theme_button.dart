import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';

class TestThemeToggleButton extends StatelessWidget {
  const TestThemeToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocSelector<ThemeCubit, ThemeState, bool>(
        selector: (c) => c.isDark,
        builder: (context, isDark) {
          final activeColor = isDark ? colors.accent : colors.secondary;
          final bgColor = isDark ? colors.accentSoft : colors.secondarySoft;

          return GestureDetector(
            onTap: () => context.read<ThemeCubit>().changeTheme(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: context.isLarge ? 120 : 108,
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: activeColor, width: 1),
                color: bgColor,
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment:
                        isDark ? Alignment.centerLeft : Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(isDark ? 'DEBUG' : 'INSPECT',
                          style: AppTextStyles.buttonTitle(
                              context: context, color: activeColor)),
                    ),
                  ),
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment:
                        isDark ? Alignment.centerRight : Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: activeColor,
                      ),
                      child: Icon(
                        !isDark ? Portfolio.magniferBug : Portfolio.bug,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
