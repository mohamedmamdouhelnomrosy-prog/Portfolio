import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Utilities/Constants/constants.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Custom/card_with_text.dart';
import 'package:portfolio/Widgets/rounded_image_widget.dart';

class CertificationCard extends StatefulWidget {
  final CertificateEntity item;
  final double imageWidth, imageHeight;
  final int index;

  const CertificationCard({
    super.key,
    required this.item,
    this.imageHeight = 48,
    this.imageWidth=72, required this.index,
  });

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> {
  bool hover =false;
  void hovering(bool h)=> setState(() {
    hover =h;
  });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return MouseRegion(
      onEnter: (_) => hovering(true),
      onExit: (_) => hovering(false),
      child: AnimatedScale(
        duration: const Duration(microseconds: 400),
        scale: hover?0.99:1,
        child:  AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(cardRadius),
            ),
            border: Border.all(
              color: hover
                  ? colors.secondary
                  :  colors.border,
              width: 1,
            ),
            boxShadow: hover ?[
              BoxShadow(
                  color: colors.border,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset:const Offset (0,4)
              )
            ]:null,
            color: ( colors.surface),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 16),
          child: Row(
            spacing: 16,
            children: [
              Text(
                widget.index < 10 ?  "0${widget.index}" :widget.index.toString(),
                style:  AppTextStyles.titleCardLarge(context: context,
                  color: colors.text3,
                ),
              ),
             RoundedImage(
                    imagePath: widget.item.certificateImageUrl,
                    width: widget.imageWidth,
                    height: widget.imageHeight,
                    radiusValue: 0,
                  ),
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.courseName ?? "",
                    style:  AppTextStyles.titleCardLarge(context: context,
                      color: colors.text1,
                    ),
                  ),
                  Text(
                    widget.item.provider ?? "",
                    style: AppTextStyles.label(context: context,
                      color: colors.secondary,
                    ),
                  ),
                ],
              ).expand,
              CardWithText(
                text: widget.item.issueDate ?? "",
                style: AppTextStyles.titleCardSmall(
                  context: context,
                  color: colors.text2,
                ),

                border: 8,
                color: colors.border.withValues(alpha: 0.4),
                borderColor: Colors.transparent,
              ),
              InkWell(
                onTap: (){
                  if(widget.item.certificateImageUrl !=null) {
                    HelperFunctions.openUrl(widget.item.certificateImageUrl!, context);
                  }
                },
                child: Icon(Icons.arrow_right_alt_rounded,size: 16,color: colors.text3,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
