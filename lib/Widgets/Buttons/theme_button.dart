import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Theme/theme_cubit.dart';
import 'package:portfolio/Core/Theme/theme_state.dart';
import 'package:portfolio/Features/home/presentation/widgets/contact/contact_button.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../Utilities/portifilo_icons.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size =!context.isSmall?40.0:32.0;
    return BlocBuilder<ThemeCubit,ThemeState>(
      buildWhen: (c,p)=>c.isDark !=p.isDark,
      builder: (context, s) {
        return CustomButtonWidget(
          onPressed: () {
            context.read<ThemeCubit>().changeTheme();
          },
          width: size,
          height: size,
          boxShadow:
          BoxShadow(
              color: colors.border,
              blurRadius: 4,
              spreadRadius: 2,
              offset: const Offset(0, 4)
          )
          ,
          borderRadiusValue: size/4,
          btnColor: s.isDark ? colors.secondary: colors.surface,
          borderColor: s.isDark ? colors.secondary: colors.border,
          child: Icon(
            Portfolio.theme,
          color: s.isDark ? Colors.white: colors.text2,
          size: size/2,
          ),

        );
      }
    );
  }
}
