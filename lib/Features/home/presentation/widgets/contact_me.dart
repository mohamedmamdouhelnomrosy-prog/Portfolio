import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Utilities/helper_function.dart';
import '../../../../Utilities/portifilo_icons.dart';
import 'contact/contact_button.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // كل زرار له فترة ظهور مختلفة عشان يعمل تأثير "متتالي" (staggered)
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
    required VoidCallback onTap,
    required IconData icon,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioCubit, PortfolioState>(
      buildWhen: (c, p) => c.data?.profile != p.data?.profile,
      builder: (context, s) {
        final buttons = <Widget>[
          _animatedButton(
            index: 0,
            total: 5,
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
            index: 1,
            total: 5,
            icon: Portfolio.linkedin,
            onTap: () {
              HelperFunctions.openUrl(s.data?.profile?.linkedin ?? "", context);
            },
          ),
          _animatedButton(
            index: 2,
            total: 5,
            icon: Portfolio.github,
            onTap: () {
              HelperFunctions.openUrl(s.data?.profile?.github ?? "", context);
            },
          ),
          _animatedButton(
            index: 3,
            total: 5,
            icon: Portfolio.whatsapp,
            onTap: () {
              HelperFunctions.openWhatsApp(
                phoneNumber: s.data?.profile?.phone ?? "",
                message: 'Hello',
              );
            },
          ),
          _animatedButton(
            index: 4,
            total: 5,
            icon: Portfolio.cv,
            onTap: () {
              HelperFunctions.openUrl(s.data?.profile?.cv ?? "", context);
            },
          ),
        ];

        return Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons,
        );
      },
    );
  }
}
