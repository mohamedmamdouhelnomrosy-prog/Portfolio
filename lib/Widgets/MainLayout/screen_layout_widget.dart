import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Utilities/extensions.dart';

import '../../Features/home/presentation/cubit/cubit.dart';
import '../../Utilities/Constants/enums.dart';
import '../../Utilities/Constants/global_keys.dart';

class ScreenLayoutWidget extends StatefulWidget {
  final List<Widget> children;
  final String? currentPath;

  const ScreenLayoutWidget(
      {super.key, required this.children, this.currentPath});

  @override
  State<ScreenLayoutWidget> createState() => _ScreenLayoutWidgetState();
}

class _ScreenLayoutWidgetState extends State<ScreenLayoutWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final cubit = context.read<PortfolioCubit>();

    final sections = {
      HomeSection.about: GlobalKeys.aboutMe,
      HomeSection.education: GlobalKeys.education,
      HomeSection.skills: GlobalKeys.skill,
      HomeSection.experience: GlobalKeys.experince,
      HomeSection.projects: GlobalKeys.projects,
      HomeSection.contact: GlobalKeys.contactMe,
    };

    for (final entry in sections.entries) {
      final ctx = entry.value.currentContext;

      if (ctx == null) continue;

      final box = ctx.findRenderObject() as RenderBox;

      final position = box.localToGlobal(Offset.zero).dy;

      if (position > 0 && position < 250) {
        cubit.changeSection(entry.key);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return RawScrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      thickness: 10,
      trackColor: colors.text3,
      controller: _scrollController,
      child: CustomScrollView(controller: _scrollController, slivers: [
        ...widget.children,
      ]),
    );
  }
}
