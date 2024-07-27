import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Context on BuildContext {
  /// The same of [MediaQuery.of(context).size]
  Size get size => MediaQuery.of(this).size;

  /// The same of [MediaQuery.of(context).size.height]
  double get height => MediaQuery.of(this).size.height;

  /// The same of [MediaQuery.of(context).size.width]
  double get width => MediaQuery.of(this).size.width;

  /// similar to [Theme.of(context)]
  ThemeData get theme => Theme.of(this);

  /// similar to [Theme.of(context).colorScheme]
  ColorScheme get color => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  Color get primaryColor => Theme.of(this).primaryColor;
}

extension FormatNumberExtension on String {
  String capitalizeFirst() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

extension StringRoundExtension on String {
  String toRoundedIntString() {
    double? value = double.tryParse(this);
    if (value == null) {
      throw FormatException("Cannot parse '$this' to a double");
    }
    return value.round().toString();
  }
}

extension StringToDoubleExtension on String {
  double toDoubleForProgressIndicator() {
    double? value = double.tryParse(this);
    if (value == null) {
      throw FormatException("Cannot parse '$this' to a double");
    }
    return value / 100;
  }
}

bool emailValidation({required String email}) {
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailRegExp.hasMatch(email);
}

bool passwordValidation({required String password}) {
  RegExp passwordRegExp =
      RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return passwordRegExp.hasMatch(password);
}

extension DateTimeExtension on DateTime {
  /// Adds the current time to the date of this DateTime instance.
  DateTime withCurrentTime() {
    DateTime currentTime = DateTime.now();
    return DateTime(
      year,
      month,
      day,
      currentTime.hour,
      currentTime.minute,
      currentTime.second,
      currentTime.millisecond,
      currentTime.microsecond,
    );
  }

  /// Formats the DateTime object into a readable string.
  String format({String pattern = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(pattern).format(this);
  }
}

extension XFormat on String {
  String toXFormat() {
    return "xxxxxx";
  }
}
