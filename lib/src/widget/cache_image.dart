import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutor/src/widget/sizedbox.dart';

class CacheImage extends StatelessWidget {
  const CacheImage({
    super.key,
    required this.url,
    this.eWidget,
    this.fit,
    this.height,
    this.width,
    this.errorWidget,
  });
  final String url;
  final Widget? eWidget;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      filterQuality: FilterQuality.high,
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      errorWidget: errorWidget ?? (_, __, e) => eWidget ?? FxBox.shrink,
    );
  }
}

void disposeImage(String url) {
  CachedNetworkImage.evictFromCache(url);
}
