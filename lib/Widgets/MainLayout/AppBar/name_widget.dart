import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/Language/app_styles.dart';
import '../../../Features/home/presentation/cubit/cubit.dart';
import '../../../Features/home/presentation/cubit/state.dart';
import '../../../Utilities/extensions.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<PortfolioCubit, PortfolioState>(
        buildWhen: (c, p) => c.data?.profile != p.data?.profile,
        builder: (context, state) {
          final profile = state.data?.profile;
          return Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 2,
            children: [
              Text(
                (profile?.firstName) == null
                    ? ""
                    : (profile!.firstName!.trim()),
                style: AppTextStyles.titleSmall(
                  context: context,
                  color: colors.text2,
                ),
              ),
              CircleAvatar(
                radius: 2,
                backgroundColor: colors.secondary,
              ).paddingOnly(top: 4),
              Text(
                (profile?.lastName ?? "").split(" ").last,
                style: AppTextStyles.titleSmall(
                  context: context,
                  color: colors.text2,
                ),
              )
            ],
          );
        });
  }
}
