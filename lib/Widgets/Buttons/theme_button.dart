import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Utilities/portifilo_icons.dart';

class ThemeButton extends StatelessWidget {
  final double? height;
  const ThemeButton({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = !context.isSmall ? 40.0 : 32.0;
    return BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (c, p) => c.isDark != p.isDark,
        builder: (context, s) {
          return GestureDetector(
            onTap: () {
              context.read<ThemeCubit>().changeTheme();
            },
            child: Icon(
              Portfolio.theme,
              color: !s.isDark ? colors.secondary : colors.secondarySoft,
              size: size / 1.5,
            ),
          );
        });
  }
}
