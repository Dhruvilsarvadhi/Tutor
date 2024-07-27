import 'package:flutter/cupertino.dart';

class NavigateUtils {
  static push(Widget widget, BuildContext context) {
    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => widget),
    );
  }

  static close( BuildContext context,{bool a = true,}) {
    return Navigator.pop(context, a);
  }

  static pushReplacement(Widget widget, BuildContext context) {
    return Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  static pushAndRemoveUntil(Widget widget, BuildContext context) {
    return Navigator.pushAndRemoveUntil(context,
        CupertinoPageRoute(builder: (context) => widget), (route) => false);
  }
}
