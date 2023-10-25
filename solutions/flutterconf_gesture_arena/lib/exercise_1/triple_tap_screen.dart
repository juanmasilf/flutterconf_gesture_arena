import 'package:flutter/material.dart';
import 'package:flutterconf_gesture_arena/app/app.dart';
import 'package:flutterconf_gesture_arena/exercise_1/triple_tap_gesture_detector.dart';

class TripleTapScreen extends StatefulWidget {
  const TripleTapScreen({super.key});

  @override
  State<TripleTapScreen> createState() => _TripleTapScreenState();
}

class _TripleTapScreenState extends State<TripleTapScreen> {
  double scale = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Triple Tap Gesture'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: TripleTapGestureDetector(
          onTripleTap: () {
            ToastHelper.showToast('onTripleTap', context);
            setState(() => scale = 1.5);
            Future.delayed(const Duration(milliseconds: 400), () {
              setState(() => scale = 1);
            });
          },
          child: TargetObject(scale: scale),
        ),
      ),
    );
  }
}
