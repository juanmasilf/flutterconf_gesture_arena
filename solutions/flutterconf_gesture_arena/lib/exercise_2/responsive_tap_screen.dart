import 'package:flutter/material.dart';
import 'package:flutterconf_gesture_arena/app/app.dart';
import 'package:flutterconf_gesture_arena/exercise_2/responsive_tap_gesture_detector.dart';

class ResponsiveTapScreen extends StatefulWidget {
  const ResponsiveTapScreen({super.key});

  @override
  State<ResponsiveTapScreen> createState() => _ResponsiveTapScreenState();
}

class _ResponsiveTapScreenState extends State<ResponsiveTapScreen> {
  double scaleRegular = 1;
  double scaleResposive = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Responsive Tap Gesture',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResponsiveTapGestureDetector(
              onTap: () {
                ToastHelper.showToast('onTap Responsive', context);
                setState(() => scaleResposive = 1.4);
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() => scaleResposive = 1);
                });
              },
              onDoubleTap: () {
                ToastHelper.showToast('onDoubleTap', context);
              },
              child: TargetObject(
                text: 'Responsive',
                scale: scaleResposive,
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {
                ToastHelper.showToast('onTap', context);
                setState(() => scaleRegular = 1.4);
                Future.delayed(const Duration(milliseconds: 300), () {
                  setState(() => scaleRegular = 1);
                });
              },
              onDoubleTap: () {
                ToastHelper.showToast('onDoubleTap', context);
              },
              child: TargetObject(
                text: 'Regular',
                scale: scaleRegular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
