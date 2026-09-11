import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/projects/project_card.dart';
import 'package:portfolio/Widgets/Portfilio/animated_list.dart';

class ProjectsList extends StatelessWidget {
  final List<ProjectEntity> projects;
  final double height;
  final int countPerRow;

  const ProjectsList({
    super.key,
    this.countPerRow = 3,
    this.height = 200,
    this.projects = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedGridView<ProjectEntity>(
      perRow: countPerRow,
      items: projects,
      mainAxisExtent: height,
      buildChild: (u) => ProjectItemCard(
        project: projects[u],
      ),
    );
  }
}
