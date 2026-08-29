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

  const CertificationCard({
    super.key,
    required this.item,
    this.imageHeight = 56,
    this.imageWidth = 88,
  });

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> {
  bool hover = false;
  void hovering(bool h) => setState(() {
        hover = h;
      });
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
        onTap: () {
          if (widget.item.certificateImageUrl != null) {
            HelperFunctions.openUrl(widget.item.certificateImageUrl!, context);
          }
        },
        child: MouseRegion(
          onEnter: (_) => hovering(true),
          onExit: (_) => hovering(false),
          child: AnimatedScale(
            duration: const Duration(microseconds: 400),
            scale: hover ? 0.99 : 1,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(cardRadius),
                  ),
                  border: Border.all(
                    color: hover ? colors.accent : colors.text3,
                    width: 1,
                  ),
                  boxShadow: hover
                      ? [
                          BoxShadow(
                              color: colors.text3,
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 4))
                        ]
                      : null,
                  color: (colors.surface),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 16,
                      children: [
                        RoundedImage(
                          imagePath: widget.item.certificateImageUrl,
                          width: widget.imageWidth,
                          height: widget.imageHeight,
                          radiusValue: 4,
                          borderColor: colors.secondary,
                        ),
                        const Spacer(),
                        CardWithText(
                          text: widget.item.issueDate ?? "",
                          style: AppTextStyles.titleCardSmall(
                            context: context,
                            color: colors.secondary,
                          ),
                          border: 4,
                          color: colors.secondarySoft,
                          borderColor: Colors.transparent,
                        ),
                        Icon(
                          Icons.arrow_right_alt_rounded,
                          size: 20,
                          color: colors.text3,
                        ),
                      ],
                    ),
                    Text(
                      widget.item.courseName ?? "",
                      style: AppTextStyles.titleCardLarge(
                        context: context,
                        color: colors.text1,
                      ),
                    ),
                    Text(
                      widget.item.provider ?? "",
                      style: AppTextStyles.subtitleCard(
                        context: context,
                        color: colors.accent,
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
