import 'package:flutter/material.dart';
import 'package:portfolio/Features/home/domain/entities/project_entity.dart';
import 'package:portfolio/Features/home/presentation/widgets/products/project_list.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Widgets/Buttons/custom_button_widget.dart';

import '../../../../../Core/Language/app_styles.dart';
import '../../../../../Utilities/Constants/constants.dart';
import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';
import '../../../../../Utilities/portifilo_icons.dart';
import '../../../../../Widgets/sections_title_widget.dart';
import 'button_widget.dart';

class MyProjectsWidget extends StatefulWidget {
  final List<ProjectEntity> projects;
  final double hozPadding;
  final double height;
  final int countPerRow;
  const MyProjectsWidget(
      {super.key,
        this.height=180,
        this.countPerRow=4,
      this.projects = const [],
      this.hozPadding = desktopHozPadding,
      });

  @override
  State<MyProjectsWidget> createState() => _MyProjectsWidgetState();
}

class _MyProjectsWidgetState extends State<MyProjectsWidget> {
  int currentIndex = 0;
  late List<ProjectEntity> man, auto;
  @override
  void initState() {
    super.initState();
  }

  void previewMan(int m) => setState(() {currentIndex = m;});
  @override
  Widget build(BuildContext context) {
    man = widget.projects.where((e) => e.isManual != false).toList();
    auto = widget.projects.where((e) => !e.isManual).toList();
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionsTitleWidget(
          icon: Portfolio.projects,
          key: GlobalKeys.projects,
          title: Strings.projects.translate.toUpperCase(),
          subtitle: '${widget.projects.length} Projects',
        ),
        Row(
          spacing: 16,
          children: [
            ButtonWidget(
              title: 'All',
              onTap: (index) {
                if(currentIndex ==0) return;
               previewMan(0);
              },
              width: 80,
              selected: currentIndex ==0,
              index: 0,
            ),  ButtonWidget(
              title: 'Manual Projects',
              onTap: (index) {
                if(currentIndex ==1) return;
               previewMan(1);
              },
              width: 120,
              selected: currentIndex ==1,
              index: 1,
            ),
            ButtonWidget(
              title: 'Automation Projects',
              onTap: (index) {
                if(currentIndex ==2) return;
                previewMan(2);
              },
              width: 140,
              selected: currentIndex ==2,
              index: 2,
            ),          ],
        ),
        if (currentIndex ==0)
          ProjectsList(
            projects: widget.projects,
            height: widget.height,
            countPerRow: widget.countPerRow,
          )
        else if (currentIndex ==1)
          ProjectsList(
            projects: man,
            height: widget.height,
            countPerRow: widget.countPerRow,
          )
        else if(currentIndex==2)
          ProjectsList(
            height: widget.height,
            countPerRow: widget.countPerRow,
            projects: auto,
          )
      ],
    ).paddingSymmetric(horizontal: widget.hozPadding);
  }
}
