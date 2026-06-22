import 'package:flutter/material.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/MainLayout/AppBar/home_app_bar.dart';

import '../../Utilities/Constants/global_keys.dart';

class MainLayoutWidget extends StatefulWidget {
  final Widget child;
  final String? currentPath;

  const MainLayoutWidget({super.key, required this.child, this.currentPath});

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  static const double _designWidth = 1539;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final screenWidth = MediaQuery.of(context).size.width;
    final scale =MediaQuery.of(context).size.width > 1539 ? (screenWidth / _designWidth).clamp(0.5, 1.0) : 1.0;

    return Scaffold(
      key: GlobalKeys.scaffoldKey,
      backgroundColor: colors.background,
      floatingActionButton:const FloatingAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      body: AnimatedScale(
        scale: scale,
        duration: Duration(milliseconds: 400),
        child: widget.child,
      ),
    );
  }
}

