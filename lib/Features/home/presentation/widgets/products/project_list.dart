import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/products/project_card.dart';

class ProjectsList extends StatelessWidget {
  final List<ProjectEntity> projects;
  final double height;
  final int countPerRow;

  const ProjectsList({
    super.key,
    this.countPerRow=3,
    this.height =200,
    this.projects = const [],
  });

  @override
  Widget build(BuildContext context) {
    return         GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:countPerRow,
          mainAxisExtent: height,
          mainAxisSpacing: 24,
          crossAxisSpacing: 8),
      itemBuilder: (c, u) => ProjectItemCard(
       project: projects[u],

      ),
      itemCount: projects.length,
    );
  }
}
