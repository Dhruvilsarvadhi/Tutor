import 'package:flutter/material.dart';
import 'package:tutor/src/widget/spinkit.dart';

class FixDialog {
  static Future<void> showLoadingDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SpinKitCircle(
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }
}
