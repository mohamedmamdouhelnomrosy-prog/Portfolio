import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/widgets/projects/button_widget.dart';
import 'package:portfolio/Utilities/Constants/enums.dart';
import 'package:portfolio/Utilities/extensions.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final ProjectCategory category;
  final bool selected;

  const CategoryButton({
    required this.title,
    required this.category,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: ButtonWidget(
      title: title,
      selected: selected,
      index: category.index,
      onTap: (_) {
        context.read<PortfolioCubit>().changeCategory(category);
      },
    ).paddingOnly(end: 8));
  }
}
