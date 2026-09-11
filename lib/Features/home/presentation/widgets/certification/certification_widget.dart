import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Features/home/presentation/cubit/cubit.dart';
import 'package:portfolio/Features/home/presentation/cubit/state.dart';
import 'package:portfolio/Features/home/presentation/widgets/certification/certification_card.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/portifilo_icons.dart';
import 'package:portfolio/Widgets/Portfilio/animated_list.dart';
import 'package:portfolio/Widgets/sections_title_widget.dart';

import '../../../../../Utilities/Constants/global_keys.dart';
import '../../../../../Utilities/Constants/strings.dart';

class CertificationSection extends StatelessWidget {
  final double hozPadding;

  const CertificationSection({
    super.key,
    this.hozPadding = desktopHozPadding,
  });

  @override
  Widget build(BuildContext context) {
    final space = context.matchedSize(large: 32, medium: 24, small: 20);
    return SliverPadding(
      key: GlobalKeys.certification,
      padding: EdgeInsetsGeometry.symmetric(horizontal: hozPadding),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverToBoxAdapter(
              child: SectionsTitleWidget(
            index: 5,
            icon: Portfolio.certification,
            title: Strings.certification.translate,
          )),
          SliverToBoxAdapter(child: space.heightBox),
          BlocSelector<PortfolioCubit, PortfolioState, List<CertificateEntity>>(
              selector: (state) => state.data?.certificates ?? [],
              builder: (context, certificates) {
                return SliverList.separated(
                  addRepaintBoundaries: true,
                  itemCount: certificates.length,
                  separatorBuilder: (ctx, index) => SizedBox(
                    height: index == certificates.length - 1 ? 0 : 24,
                  ),
                  itemBuilder: (ctx, index) => ScrollReveal(
                    axis: Axis.horizontal,
                    index: index,
                    offset: 8,
                    child: CertificationCard(
                      item: certificates[index],
                      imageHeight: 40,
                      imageWidth: 64,
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
