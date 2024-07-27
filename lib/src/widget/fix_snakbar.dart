// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutor/src/topsnakbar/custom_snakbar.dart';
import 'package:tutor/src/topsnakbar/show_top_snakbar.dart';


class CustomSnakeBar {
  final String errorMessage;
  Color? colorText;
  CustomSnakeBar({required this.errorMessage, this.colorText});

  void snakeBar(BuildContext ctx) {
    showTopSnackBar(
      Overlay.of(ctx),
      TopSnakBar.success(
        message: errorMessage,
        textStyle: TextStyle(
          fontSize: 18.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      dismissType: DismissType.onSwipe,
      displayDuration: const Duration(milliseconds: 1000),
    );
  }
}
