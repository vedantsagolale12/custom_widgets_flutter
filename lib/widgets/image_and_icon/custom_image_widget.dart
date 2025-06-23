import 'package:custom_widgets_flutter/enums/app_ui_enums.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final ImageSize? imageSize;
  final ImageFit? imageFit;
  final BorderRadius? borderRadius;
  final Color? color;
  final BlendMode? colorBlendMode;
  final bool isAsset;
  final bool isCircle;

  const CustomImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.fit,
    this.imageSize,
    this.imageFit,
    this.borderRadius,
    this.color,
    this.colorBlendMode,
    this.isAsset = true,
    this.isCircle = false,
  });

  double? _resolveImageSize(ImageSize? size) {
    switch (size) {
      case ImageSize.thumbnail:
        return 64;
      case ImageSize.small:
        return 128;
      case ImageSize.medium:
        return 256;
      case ImageSize.large:
        return 512;
      case ImageSize.extraLarge:
        return 1024;
      case ImageSize.fullWidth:
        return double.infinity;
      default:
        return null;
    }
  }

  BoxFit _resolveFit(ImageFit? imageFit) {
    switch (imageFit) {
      case ImageFit.contain:
        return BoxFit.contain;
      case ImageFit.cover:
        return BoxFit.cover;
      case ImageFit.fill:
        return BoxFit.fill;
      case ImageFit.fitWidth:
        return BoxFit.fitWidth;
      case ImageFit.fitHeight:
        return BoxFit.fitHeight;
      case ImageFit.scaleDown:
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  @override
  Widget build(BuildContext context) {
    final resolvedWidth = width ?? _resolveImageSize(imageSize);
    final resolvedHeight = height ?? _resolveImageSize(imageSize);
    final resolvedFit = fit ?? _resolveFit(imageFit);

    Widget imageWidget = isAsset
        ? Image.asset(
            path,
            width: resolvedWidth,
            height: resolvedHeight,
            fit: resolvedFit,
            color: color,
            colorBlendMode: colorBlendMode,
          )
        : Image.network(
            path,
            width: resolvedWidth,
            height: resolvedHeight,
            fit: resolvedFit,
            color: color,
            colorBlendMode: colorBlendMode,
          );

    if (isCircle) {
      return ClipOval(child: imageWidget);
    }

    if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}
