import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

class CustomResumeButton extends StatelessWidget {
  const CustomResumeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final size = context.matchedSize(
        large: largeButtonIcon,
        medium: mediumButtonIcon,
        small: smallButtonIcon);
    return CustomButtonWidget.outLined(
        onPressed: () {
          final cv = context.read<PortfolioCubit>().state.data?.profile?.cv;
          if (cv == null || cv.isEmpty) return;
          HelperFunctions.openUrl(cv, context);
        },
        borderColor: colors.secondarySoft,
        height: size,
        width: 80,
        borderRadiusValue: 8,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 4,
            children: [
              Text(
                'Resume',
                style: AppTextStyles.buttonTitle(
                    context: context, color: colors.secondary),
              ),
              Icon(Icons.arrow_downward, size: 14, color: colors.secondary),
            ]));
  }
}
