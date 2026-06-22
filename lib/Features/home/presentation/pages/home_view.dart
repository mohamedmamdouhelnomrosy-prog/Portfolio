import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Core/Layout/layout_handler.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';

import 'Layouts/l_home_view.dart';
import 'Layouts/m_home_view.dart';
import 'Layouts/s_home_view.dart';

class HomeView extends StatefulWidget {
  static String routeName = ScreenRoutes.home.name;

  const HomeView({
    super.key,
  });

  @override
  createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with LayoutHandlerMixin {
  @override
  void initState() {
    Future.delayed(Duration.zero,
        () async => await context.read<PortfolioCubit>().getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context);
  }

  @override
  Widget buildLargeScreen() {
    return LargeHomeView();
  }

  @override
  Widget buildMediumScreen() {
    return MediumHomeView();
  }

  @override
  Widget buildSmallScreen() {
    return SmallHomeView();
  }
}
