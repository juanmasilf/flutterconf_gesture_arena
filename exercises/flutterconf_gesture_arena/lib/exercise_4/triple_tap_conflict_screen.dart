// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutterconf_gesture_arena/app/app.dart';
import 'package:flutterconf_gesture_arena/exercise_4/triple_tap_conflict_gesture_detector.dart';

class TripleTapConflictScreen extends StatefulWidget {
  const TripleTapConflictScreen({super.key});

  @override
  State<TripleTapConflictScreen> createState() =>
      _TripleTapConflictScreenState();
}

class _TripleTapConflictScreenState extends State<TripleTapConflictScreen> {
  bool incrementSize = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Triple Tap conflict Gesture',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: TripleTapConflictGestureDetector(
          onTap: () {
            ToastHelper.showToast('onTap', context);
          },
          onTripleTap: () {
            ToastHelper.showToast('onTripleTap', context);
            setState(() {
              incrementSize = !incrementSize;
            });
          },
          child: const TargetObject(),
        ),
      ),
    );
  }
}
