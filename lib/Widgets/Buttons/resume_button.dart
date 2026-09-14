import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

class CustomResumeButton extends StatefulWidget {
  final String? email;

  const CustomResumeButton({super.key, this.email});

  @override
  State<CustomResumeButton> createState() => _CustomResumeButtonState();
}

class _CustomResumeButtonState extends State<CustomResumeButton> {
  bool hover = false;
  void hovering(bool h) => setState(() {
        hover = h;
      });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.isLarge
        ? lThemeButtonSize
        : context.isMedium
            ? mThemeButtonSize
            : sThemeButtonSize;

    return MouseRegion(
      onEnter: (_) => hovering(true),
      onExit: (_) => hovering(false),
      child: AnimatedScale(
          scale: hover ? 1.02 : 1,
          duration: const Duration(milliseconds: 250),
          child: CustomButtonWidget(
            borderRadiusValue: 0,
            onPressed: () {
              final cv = context.read<PortfolioCubit>().state.data?.profile?.cv;
              if (cv == null || cv.isEmpty) return;
              HelperFunctions.openUrl(cv, context);
            },
            btnColor: !hover ? Colors.transparent : colors.secondarySoft,
            borderColor: colors.border,
            height: size,
            child: Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Resume',
                  style: AppTextStyles.buttonTitle(
                    context: context,
                    color: colors.secondary,
                  ),
                ),
                Icon(
                  Icons.arrow_downward_outlined,
                  color: colors.secondary,
                  size: size / 2.5,
                ),
              ],
            ),
          )),
    );
  }
}
