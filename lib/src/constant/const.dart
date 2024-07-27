import 'package:flutter/material.dart';

OverlayEntry? overlayEntry;
OverlayState? overlayState;

final ValueNotifier<int> currentTab = ValueNotifier<int>(0);

class Constants {
  static final ValueNotifier<int> selectedLanguage = ValueNotifier<int>(0);
  static const String englishFontFamily = "BunkenTechSansSCWide";
  static const japanesFontFamily = "Hiragino Sans";
  static const robotoCondensedFontFamily = "RobotoCondensed";
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
