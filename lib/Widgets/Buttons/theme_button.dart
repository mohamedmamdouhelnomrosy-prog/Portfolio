import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

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
          return CustomButtonWidget(
            onPressed: () {
              context.read<ThemeCubit>().changeTheme();
            },
            width: size,
            height: size,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            btnColor: s.isDark ? colors.accent : colors.accentSoft,
            borderColor: s.isDark ? colors.accent : colors.accentSoft,
            child: Icon(
              Portfolio.theme,
              color: !s.isDark ? colors.accent : colors.accentSoft,
              size: size / 2,
            ),
          );
        });
  }
}
