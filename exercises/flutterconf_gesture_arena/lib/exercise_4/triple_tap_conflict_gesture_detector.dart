import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TripleTapConflictGestureDetector extends StatefulWidget {
  const TripleTapConflictGestureDetector({
    required this.child,
    super.key,
    this.onTap,
    this.onTripleTap,
  });

  /// The callback that is called when the child is tapped once.
  final VoidCallback? onTap;

  /// The callback that is called when the child is tapped with a triple tap.
  final VoidCallback? onTripleTap;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<TripleTapConflictGestureDetector> createState() =>
      _TripleTapConflictGestureDetectorState();
}

class _TripleTapConflictGestureDetectorState
    extends State<TripleTapConflictGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        TapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TapGestureRecognizer>(
          TapGestureRecognizer.new,
          (TapGestureRecognizer instance) {
            instance.onTap = widget.onTap;
          },
        ),
        TripleTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<TripleTapGestureRecognizer>(
          TripleTapGestureRecognizer.new,
          (TripleTapGestureRecognizer instance) {
            instance.onTripleTap = widget.onTripleTap;
          },
        ),
      },
      child: widget.child,
    );
  }
}

/// Signature for when the user has tapped the screen three times
typedef GestureTripleTapCallback = void Function();

// EXERCISE 4: Completes the TripleTapGestureRecognizer to work as expected
// with a TapGestureRecognizer in the same RawGestureDetector

class TripleTapGestureRecognizer extends GestureRecognizer {
  /// Timer to keep track of the time between taps
  Timer? countdown;

  /// Counter to keep track of the number of taps
  int tapCounter = 0;

  /// Duration between taps to be considered a triple tap
  static const Duration countdownDuration = Duration(milliseconds: 300);

  /// Callback to be called when the user has tapped the screen three times
  GestureTripleTapCallback? onTripleTap;

  @override
  void addAllowedPointer(PointerEvent event) {
    // Add the pointer to the list of allowed pointers
    // and start tracking the pointer event
    // with the `_handleEvent` method
    GestureBinding.instance.pointerRouter
        .addRoute(event.pointer, _handleEvent, event.transform);
  }

  /// Handle the pointer events
  void _handleEvent(PointerEvent event) {
    if (event is PointerDownEvent) {
      _processPointerDownEvent(event);
    } else if (event is PointerUpEvent) {
      _processPointerUpEvent(event);
    }
  }

  /// Process the pointer down event by resetting the countdown timer
  /// to keep track of the time between taps
  void _processPointerDownEvent(PointerDownEvent event) {
    _resetCountdown();
  }

  /// Process the pointer up event by incrementing the tap counter
  /// and checking if the user has tapped the screen three times
  /// within the countdown duration
  /// If the user has tapped the screen three times within the countdown
  /// duration, the callback is called and the countdown is stopped
  void _processPointerUpEvent(PointerUpEvent event) {
    tapCounter++;
    if (tapCounter == 3) {
      onTripleTap?.call();
      _resetCounter();
      _stopCountdown();
    }
  }

  void _resetCountdown() {
    countdown?.cancel();
    countdown = Timer(countdownDuration, _resetCounter);
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
    /// triple tap gesture recognizer
  }

  @override
  void rejectGesture(int pointer) {
    /// In this case we are not using the rejectGesture method
    /// because this is a simplified implementation of the
    /// triple tap gesture recognizer
  }

  @override
  String get debugDescription => 'Triple Tap';

  @override
  void dispose() {
    _stopCountdown();
    super.dispose();
  }
}
