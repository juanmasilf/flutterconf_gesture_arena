import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DoubleTapAndHoldGestureDetector extends StatefulWidget {
  const DoubleTapAndHoldGestureDetector({
    required this.child,
    super.key,
    this.onDoubleTapAndHold,
    this.onDoubleTapAndHoldEnd,
  });

  /// The callback that is called when the user has tapped and hold the widget.
  final VoidCallback? onDoubleTapAndHold;

  /// The callback that is called when the hold ends.
  final VoidCallback? onDoubleTapAndHoldEnd;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<DoubleTapAndHoldGestureDetector> createState() =>
      _DoubleTapAndHoldGestureDetectorState();
}

class _DoubleTapAndHoldGestureDetectorState
    extends State<DoubleTapAndHoldGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        DoubleTapAndHoldGestureRecognizers:
            GestureRecognizerFactoryWithHandlers<
                DoubleTapAndHoldGestureRecognizers>(
          DoubleTapAndHoldGestureRecognizers.new,
          (DoubleTapAndHoldGestureRecognizers instance) {
            instance
              ..onDoubleTapAndHold = widget.onDoubleTapAndHold
              ..onDoubleTapAndHoldEnd = widget.onDoubleTapAndHoldEnd;
          },
        ),
      },
      child: widget.child,
    );
  }
}

/// Signature for when the user has tapped two times and hold the screen
typedef GestureDoubleTapAndHoldCallback = void Function();

/// Recognizes when the user has tapped two times and hold the screen
class DoubleTapAndHoldGestureRecognizers extends GestureRecognizer {
  /// Timer to keep track of the time between taps
  Timer? countdown;

  /// Timer to keep track of the of the hold
  Timer? hold;

  /// Counter to keep track of the number of taps
  int tapCounter = 0;

  /// Duration between taps to be considered a double tap
  static const Duration countdownDuration = Duration(milliseconds: 300);

  /// Duration between taps to be considered a hold
  static const Duration holdDuration = Duration(milliseconds: 500);

  /// Callback to be called when the user has tapped and hold the screen
  GestureDoubleTapAndHoldCallback? onDoubleTapAndHold;

  /// Callback to be called when the hold ends
  GestureDoubleTapAndHoldCallback? onDoubleTapAndHoldEnd;

  @override
  void addAllowedPointer(PointerEvent event) {
    GestureBinding.instance.pointerRouter
        .addRoute(event.pointer, _handleEvent, event.transform);
  }

  /// Handles the pointer event
  void _handleEvent(PointerEvent event) {
    if (event is PointerDownEvent) {
      // if the user already tapped the screen two times
      // and the hold is not started yet, start the hold
      // duration check
      if (tapCounter == 2) {
        _stopCountdown();
        hold = Timer(holdDuration, () {
          onDoubleTapAndHold?.call();
        });
      } else {
        // if the user has not tapped the screen two times yet
        // reset the countdown timer
        _resetCountdown();
      }
    } else if (event is PointerUpEvent) {
      if (tapCounter == 2) {
        // if the user has tapped the screen two times
        // and the hold is started, stop the hold
        // and reset the counter
        hold?.cancel();
        _resetCounter();
        onDoubleTapAndHoldEnd?.call();
      } else {
        // if the user has not tapped the screen two times yet
        // increment the tap counter
        tapCounter++;
      }
    }
  }

  void _resetCountdown() {
    countdown?.cancel();
    countdown = Timer(countdownDuration, () {
      tapCounter = 0;
    });
  }

  void _resetCounter() {
    tapCounter = 0;
  }

  void _stopCountdown() {
    countdown?.cancel();
    countdown = null;
  }

  @override
  void acceptGesture(int pointer) {
    /// In this case we are not using the acceptGesture method
    /// because this is a simplified implementation of the
    /// double tap and hold gesture recognizer
  }

  @override
  void rejectGesture(int pointer) {
    /// In this case we are not using the rejectGesture method
    /// because this is a simplified implementation of the
    /// double tap and hold gesture recognizer
  }

  @override
  String get debugDescription => 'Double Tap and Hold';
}
