import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterconf_gesture_arena/app/app.dart';
import 'package:flutterconf_gesture_arena/exercise_3/double_tap_and_hold_gesture_detector.dart';

class DoubleTapAndHoldScreen extends StatefulWidget {
  const DoubleTapAndHoldScreen({super.key});

  @override
  State<DoubleTapAndHoldScreen> createState() => _DoubleTapAndHoldScreenState();
}

class _DoubleTapAndHoldScreenState extends State<DoubleTapAndHoldScreen> {
  double scale = 1;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          scale > 1.0 ? 'Holding...' : 'Double Tap and Hold Gesture',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: DoubleTapAndHoldGestureDetector(
          onDoubleTapAndHold: () {
            ToastHelper.showToast('onDoubleTapAndHold', context);
            timer =
                Timer.periodic(const Duration(milliseconds: 300), (Timer t) {
              setState(() => scale = scale * 1.1);
            });
          },
          onDoubleTapAndHoldEnd: () {
            setState(() {
              timer?.cancel();
              scale = 1.0;
            });
          },
          child: TargetObject(scale: scale),
        ),
      ),
    );
  }
}
