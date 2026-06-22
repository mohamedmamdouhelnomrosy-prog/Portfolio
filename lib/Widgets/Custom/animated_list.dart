import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:portfolio/Utilities/extensions.dart';

class AnimatedGridView<T> extends StatelessWidget {
  final int perRow;
  final double mainAxisExtent;
  final List<T> items;
  final Widget Function(int) buildChild;
  const AnimatedGridView({super.key, required this.perRow, required this.mainAxisExtent, required this.items, required this.buildChild});

  @override
  Widget build(BuildContext context) {
    return           GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: perRow,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: mainAxisExtent),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 1000),
            child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: buildChild(index))));
      },
    );
  }
}
class AnimatedListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(int) buildChild;
  const AnimatedListView({super.key, required this.items, required this.buildChild});

  @override
  Widget build(BuildContext context) {
    return           ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (c,i)=>20.0.heightBox,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            duration: Duration(milliseconds: 1000),
            child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: buildChild(index))));
      },
    );
  }
}
