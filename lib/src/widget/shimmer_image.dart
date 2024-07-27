import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tutor/src/constant/color.dart';

class ShimmerImage {
  static Widget images(
      BuildContext context, String url, double height, double width,
      BoxFit? fit) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height.h,
      width: width.w,
      fit: fit ,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: ConstColor.inputFilledColor,
        highlightColor: ConstColor.inputHintTextColor,
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: ConstColor.white,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
