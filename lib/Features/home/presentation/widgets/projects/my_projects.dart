import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/projects/category/projects_category_list.dart';
import 'package:portfolio/Features/home/presentation/widgets/projects/project_list.dart';
import 'package:portfolio/Utilities/Constants/global_keys.dart';
import 'package:portfolio/Utilities/Constants/strings.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/constants.dart';

class MyProjectsWidget extends StatelessWidget {
  final double hozPadding;
  final double height;
  final int countPerRow;

  const MyProjectsWidget({
    super.key,
    this.height = 260,
    this.countPerRow = 4,
    this.hozPadding = desktopHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    return _MyProjectsContent(
      hozPadding: hozPadding,
      height: height,
      countPerRow: countPerRow,
    );
  }
}

class _MyProjectsContent extends StatelessWidget {
  final double hozPadding;
  final double height;
  final int countPerRow;

  const _MyProjectsContent({
    required this.hozPadding,
    required this.height,
    required this.countPerRow,
  });

  @override
  Widget build(BuildContext context) {
    final space = context.matchedSize(
      large: 32,
      medium: 24,
      small: 20,
    );

    return SliverPadding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: hozPadding,
      ),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
            child: BlocSelector<PortfolioCubit, PortfolioState, int>(
                selector: (c) => (c.data?.projects ?? []).length,
                builder: (c, totalProjects) => SectionsTitleWidget(
                      index: 4,
                      icon: Portfolio.projects,
                      key: GlobalKeys.projects,
                      title: Strings.projects.translate,
                      subtitle: '$totalProjects Projects',
                    )),
          ),
          SliverToBoxAdapter(
            child: space.heightBox,
          ),
          const CategoryButtons(),
          SliverToBoxAdapter(
            child: space.heightBox,
          ),
          BlocBuilder<PortfolioCubit, PortfolioState>(
            buildWhen: (previous, current) =>
                previous.projectCategory != current.projectCategory ||
                previous.data != current.data,
            builder: (context, state) {
              return ProjectsList(
                projects: state.currentProjects,
                height: height,
                category: state.projectCategory.name,
                countPerRow: countPerRow,
              );
            },
          )
        ],
      ),
    );
  }
}
