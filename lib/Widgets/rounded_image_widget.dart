import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Utilities/extensions.dart';

class RoundedImage extends StatelessWidget {
  final Color? backgroundColor, borderColor;
  final double?  borderWidth;
  final double padding,  radiusValue, width, height;
  final String? imagePath;
  final BoxFit? fit;

  const RoundedImage({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.imagePath,
    this.fit,
    this.padding=0 ,
    this.radiusValue=100,
    this.width=100,
    this.borderWidth,
    this.height=100,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || imagePath!.trim().isEmpty) {
      return _PlaceholderWidget(
        padding: padding,
        backgroundColor: backgroundColor,
        radiusValue: radiusValue,
        borderColor: borderColor,
        borderWidth: borderWidth,
        height: height,
        width: width,
      );
    }

    return _ImageWidget(
      imagePath: imagePath!,
      padding: padding,
      borderWidth: borderWidth,
      backgroundColor: backgroundColor,
      borderColor: borderColor, // ✅ Fix: was passing backgroundColor by mistake
      fit: fit,
      radiusValue: radiusValue,
      height: height,
      width: width,
    );
  }
}

// ---------------------------------------------------------------------------
// Placeholder (no image)
// ---------------------------------------------------------------------------
class _PlaceholderWidget extends StatelessWidget {
  final double?  borderWidth;
  final double padding,  radiusValue, width, height;
  final Color? backgroundColor, borderColor;

  const _PlaceholderWidget({
    this.padding=0,
    this.radiusValue=100,
    this.width=100,
    this.height=100,
    this.borderWidth,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.all(padding ),
      height: height ,
      width: width ,
      decoration: _buildDecoration(colors),
      child: Icon(
        Icons.photo,
        size: (height) * 0.5,
        color: colors.text1.withValues(alpha: 0.4),
      ),
    );
  }

  BoxDecoration _buildDecoration(colors) => BoxDecoration(
    borderRadius: BorderRadius.circular(radiusValue),
    color: backgroundColor ?? colors.surface,
    border: borderColor == null
        ? null
        : Border.all(
      color: borderColor!,
      width: borderWidth ?? 1,
    ),
  );
}

// ---------------------------------------------------------------------------
// Image widget
// ---------------------------------------------------------------------------
class _ImageWidget extends StatelessWidget {
  final Color? backgroundColor, borderColor;
  final double?  borderWidth;
  final double padding,  radiusValue, width, height;
  final String imagePath;
  final BoxFit? fit;

  const _ImageWidget({
    required this.imagePath,
    this.backgroundColor,
    this.borderColor,
    this.fit,
    this.padding=0,
    this.radiusValue=100,
    this.width=100,
    this.height=100,
    this.borderWidth,
  });

  bool get _isNetwork =>
      imagePath.startsWith('http://') || imagePath.startsWith('https://');

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: EdgeInsets.all(padding ),
      height: height ,
      width: width ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusValue),
        color: backgroundColor ?? colors.surface,
        border: borderColor == null
            ? null
            : Border.all(
          color: borderColor!,
          width: borderWidth ?? 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radiusValue),
        child: _isNetwork ? _buildNetworkImage(colors) : _buildAssetImage(),
      ),
    );
  }

  Widget _buildNetworkImage(colors) {
    return  CachedNetworkImage(
          imageUrl: imagePath,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          memCacheHeight: height.toInt() ,
          maxWidthDiskCache: width.toInt() ,
          // Loading shimmer
          placeholder: (context, url) => _ShimmerBox(
            width: width,
            height: height,
            radiusValue: radiusValue,
          ),
          // Error fallback
          errorWidget: (context, url, error) => _ErrorFallback(
            radius: height,
            colors: colors,
          ),
    );
  }

  Widget _buildAssetImage() {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.broken_image_outlined,
        size: (height ) * 0.5,
        color: Colors.grey,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shimmer placeholder while loading
// ---------------------------------------------------------------------------
class _ShimmerBox extends StatefulWidget {
  final double? width, height, radiusValue;

  const _ShimmerBox({this.width, this.height,  this.radiusValue});

  @override
  State<_ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<_ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.3, end: 0.7).animate(_ctrl);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => Container(
        width: widget.width,
        height: widget.height ?? 100,
        decoration: BoxDecoration(
          shape: widget.radiusValue == null
              ? BoxShape.circle
              : BoxShape.rectangle,
          borderRadius: widget.radiusValue == null
              ? null
              : BorderRadius.circular(widget.radiusValue!),
          color: Colors.grey.withValues(alpha:_anim.value),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Error fallback
// ---------------------------------------------------------------------------
class _ErrorFallback extends StatelessWidget {
  final double? radius;
  final dynamic colors;

  const _ErrorFallback({this.radius, required this.colors});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: (radius ?? 32) / 2,
      backgroundColor: colors.surface,
      child: Icon(
        Icons.photo,
        size: (radius ?? 32) * 0.45,
        color: colors.text1.withOpacity(0.5),
      ),
    );
  }
}