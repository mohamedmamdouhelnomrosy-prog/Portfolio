import 'package:flutter/material.dart';

import '../../../../../Utilities/extensions.dart';
import '../../../../../Widgets/Portfilio/divider.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.0.heightBox,
        // const DividerWidget(),
        // 16.0.heightBox,
      ],
    );
  }
}
