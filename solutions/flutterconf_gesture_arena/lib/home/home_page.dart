import 'package:flutter/material.dart';
import 'package:flutterconf_gesture_arena/app/app.dart';
import 'package:flutterconf_gesture_arena/exercise_1/triple_tap_screen.dart';
import 'package:flutterconf_gesture_arena/exercise_2/responsive_tap_screen.dart';
import 'package:flutterconf_gesture_arena/exercise_3/double_tap_and_hold_screen.dart';
import 'package:flutterconf_gesture_arena/exercise_4/triple_tap_conflict_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const FittedBox(
          child: Text('Como ser un gladiador en el Gesture Arena'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const TripleTapScreen(),
                  ),
                ),
                text: 'Ej 1 - Triple tap',
              ),
              AppButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const ResponsiveTapScreen(),
                  ),
                ),
                text: 'Ej 2 - Responsive Tap',
              ),
              AppButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const DoubleTapAndHoldScreen(),
                  ),
                ),
                text: 'Ej 3 - Double Tap and Hold',
              ),
              AppButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const TripleTapConflictScreen(),
                  ),
                ),
                text: 'Ej 4 - Triple tap conflict',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
