import 'package:flutter/cupertino.dart';
import 'package:portfolio/Features/home/domain/entities/profile_entity.dart';

import '../../../../../../Core/Language/app_styles.dart';
import '../../../../../../Utilities/extensions.dart';

class HeadlineWidget extends StatefulWidget {
  final ProfileEntity? profile;
  const HeadlineWidget({
    super.key,
    this.profile,
  });

  @override
  State<HeadlineWidget> createState() => _HeadlineWidgetState();
}

class _HeadlineWidgetState extends State<HeadlineWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> firstFade;
  late Animation<Offset> firstSlide;

  late Animation<double> secondFade;
  late Animation<Offset> secondSlide;

  late Animation<double> thirdFade;
  late Animation<Offset> thirdSlide;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    firstFade = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.33, curve: Curves.easeOut),
    );
    firstSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.0, 0.33, curve: Curves.easeOutCubic),
    ));

    secondFade = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.33, 0.66, curve: Curves.easeOut),
    );
    secondSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.33, 0.66, curve: Curves.easeOutCubic),
    ));

    thirdFade = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.66, 0.99, curve: Curves.easeOut),
    );
    thirdSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: const Interval(0.66, 0.99, curve: Curves.easeOutCubic),
    ));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeTransition(
          opacity: firstFade,
          child: SlideTransition(
            position: firstSlide,
            child: Text(
              'Ensuring Quality,',
              style:
                  AppTextStyles.headline(context: context, color: colors.text1),
            ),
          ),
        ),
        FadeTransition(
          opacity: secondFade,
          child: SlideTransition(
            position: secondSlide,
            child: ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [
                  colors.accent,
                  colors.accent,
                  colors.accentSoft,
                ],
              ).createShader(bounds),
              child: Text(
                'One Test Case at a Time.',
                style: AppTextStyles.headline(
                    context: context, color: colors.accent),
              ),
            ),
          ),
        ),
        FadeTransition(
          opacity: thirdFade,
          child: SlideTransition(
            position: thirdSlide,
            child: Text(
              widget.profile?.summary ?? "",
              style: AppTextStyles.summaryBody(
                context: context,
                color: colors.text2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
