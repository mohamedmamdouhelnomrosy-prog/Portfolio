import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/projects/category/category_button.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Utilities/extensions.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons();

  @override
  Widget build(BuildContext context) {
    final width = context.matchedSize(
        large: context.width * 0.30,
        medium: context.width * 0.8,
        small: context.width);
    return BlocSelector<PortfolioCubit, PortfolioState, ProjectCategory>(
      selector: (state) => state.projectCategory,
      builder: (context, category) {
        return SliverConstrainedCrossAxis(
            maxExtent: width,
            sliver: SliverCrossAxisGroup(
              slivers: [
                SliverCrossAxisExpanded(
                    flex: 3,
                    sliver: CategoryButton(
                      title: 'E-commerce',
                      category: ProjectCategory.eCommerce,
                      selected: category == ProjectCategory.eCommerce,
                    )),
                SliverCrossAxisExpanded(
                    flex: 2,
                    sliver: CategoryButton(
                      title: 'ERP',
                      category: ProjectCategory.erp,
                      selected: category == ProjectCategory.erp,
                    )),
                SliverCrossAxisExpanded(
                    flex: 2,
                    sliver: CategoryButton(
                      title: 'FinTech',
                      category: ProjectCategory.finTech,
                      selected: category == ProjectCategory.finTech,
                    )),
                SliverCrossAxisExpanded(
                    flex: 2,
                    sliver: CategoryButton(
                      title: 'Other',
                      category: ProjectCategory.other,
                      selected: category == ProjectCategory.other,
                    )),
              ],
            ));
      },
    );
  }
}
