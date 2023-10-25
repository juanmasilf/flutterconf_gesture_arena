// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class ToastHelper {
  /// Shows a toast with the given [text] and
  /// print it in the debug console
  static void showToast(String text, BuildContext context) {
    print(text);
    Fluttertoast.showToast(
      msg: text,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      textColor: Colors.black,
    );
  }
}
