// crash_reporting.dart


import 'dart:isolate';
import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashReporting {
  static void initialize() {
    // Set up error handling for Flutter errors
    FlutterError.onError = (FlutterErrorDetails details) async {
    await  FirebaseCrashlytics.instance.recordFlutterError(details);
      // Log the error locally for debugging purposes
     };

    // Set up error handling for uncaught asynchronous errors
    PlatformDispatcher.instance.onError = (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
      return true;
    };

    // Set up error handling for isolate errors
    Isolate.current.addErrorListener(RawReceivePort((pair) async {
      final List<dynamic> errorAndStacktrace = pair;
      await FirebaseCrashlytics.instance.recordError(
        errorAndStacktrace.first,
        errorAndStacktrace.last,
        fatal: true,
      );
     }).sendPort);
  }

 
  static Future<void> setCustomKey(String key, String value) async {
    await FirebaseCrashlytics.instance.setCustomKey(key, value.toString());
  }
}
