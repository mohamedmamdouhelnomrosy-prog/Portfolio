import 'package:flutter/material.dart';

import '../../Utilities/extensions.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingWidget({super.key, this.isLoading = false, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return !isLoading
        ? CircularProgressIndicator(
            color: colors.accent,
          )
        : child;
  }
}
