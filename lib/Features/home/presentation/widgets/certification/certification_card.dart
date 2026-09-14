import 'package:flutter/material.dart';
import 'package:portfolio/Core/Language/app_styles.dart';
import 'package:portfolio/Features/home/domain/entities/certificate_entity.dart';
import 'package:portfolio/Utilities/extensions.dart';
import 'package:portfolio/Utilities/helper_function.dart';
import 'package:portfolio/Widgets/Custom/card_with_animation.dart';
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
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
        onTap: () {
          if (widget.item.certificateImageUrl != null) {
            HelperFunctions.openUrl(widget.item.certificateImageUrl!, context);
          }
        },
        child: InteractiveCard(
          child: (h) => AnimatedScale(
              scale: h ? 1.03 : 1,
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  RoundedImage(
                    width: widget.imageWidth,
                    height: widget.imageHeight,
                    imagePath: widget.item.certificateImageUrl,
                    radiusValue: 0,
                    fit: BoxFit.fill,
                    borderColor: colors.accentSoft,
                    borderWidth: 4,
                    padding: 8,
                  ),
                  Container(
                    height: 72,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    width: widget.imageWidth,
                    color: colors.accentSoft,
                    child: Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.item.courseName ?? "",
                          style: AppTextStyles.subtitleCard(
                            context: context,
                            color: colors.text1,
                          ),
                          maxLines: 2,
                        ),
                        Text(
                          (widget.item.provider ?? "") +
                              ". ${widget.item.issueDate ?? ""}",
                          style: AppTextStyles.body(
                            context: context,
                            color: colors.text3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
