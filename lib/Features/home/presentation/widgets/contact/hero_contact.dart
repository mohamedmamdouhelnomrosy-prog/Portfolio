import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../../Utilities/helper_function.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import 'contact_button.dart';

class HeroContact extends StatefulWidget {
  const HeroContact({super.key});

  @override
  State<HeroContact> createState() => _HeroContactState();
}

class _HeroContactState extends State<HeroContact>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_hasAnimated && info.visibleFraction > 0.2) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  Animation<double> _fadeAnimation(int index, int totalCount) {
    final start = index / totalCount * 0.6;
    final end = start + 0.4;
    return CurvedAnimation(
      parent: _controller,
      curve: Interval(start, end, curve: Curves.easeOut),
    );
  }

  Widget _animatedButton({
    required int index,
    required int total,
    VoidCallback? onTap,
    required IconData icon,
    required String title,
    required String value,
  }) {
    final animation = _fadeAnimation(index, total);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - animation.value)),
            child: Transform.scale(
              scale: 0.85 + (0.15 * animation.value),
              child: child,
            ),
          ),
        );
      },
      child: ContactButton(
        onTap: onTap,
        icon: icon,
        title: title,
        value: value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('hero-contact-visibility'),
      onVisibilityChanged: _onVisibilityChanged,
      child: BlocBuilder<PortfolioCubit, PortfolioState>(
        buildWhen: (c, p) => c.data?.profile != p.data?.profile,
        builder: (context, s) {
          final name =
              "${s.data?.profile?.firstName ?? ""}${s.data?.profile?.lastName?.split(" ").firstOrNull ?? ""}";
          final buttons = <Widget>[
            _animatedButton(
              index: 0,
              total: 5,
              title: 'Email',
              value: s.data?.profile?.email ?? "",
              icon: Portfolio.email,
              onTap: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: s.data?.profile?.email ?? "",
                );
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                }
              },
            ),
            _animatedButton(
              index: 3,
              total: 5,
              title: 'Phone',
              value: s.data?.profile?.phone ?? "",
              icon: Portfolio.whatsapp,
              onTap: () {
                HelperFunctions.openWhatsApp(
                  phoneNumber: s.data?.profile?.phone ?? "",
                  message: 'Hello',
                );
              },
            ),
            _animatedButton(
              index: 1,
              total: 5,
              title: 'Location',
              value: s.data?.profile?.location ?? "",
              icon: Portfolio.linkedin,
              onTap: () {
                HelperFunctions.openUrl(
                    s.data?.profile?.linkedin ?? "", context);
              },
            ),
          ];

          return Wrap(
            spacing: 0,
            runSpacing: 0,
            children: buttons,
          );
        },
      ),
    );
  }
}
