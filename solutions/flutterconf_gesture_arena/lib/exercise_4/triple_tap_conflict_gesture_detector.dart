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

class TripleTapGestureRecognizer extends GestureRecognizer {
  /// Timer to keep track of the time between taps
  Timer? countdown;

  /// Counter to keep track of the number of taps
  int tapCounter = 0;

  /// Pointer entry to keep track of the first pointer
  GestureArenaEntry? firstPointer;

  /// Pointer entry to keep track of the second pointer
  GestureArenaEntry? secondPointer;

  /// Pointer entry to keep track of the third pointer
  GestureArenaEntry? thirdPointer;
  // Duration between taps to be considered a triple tap
  static const Duration countdownDuration = Duration(milliseconds: 300);

  /// Callback to be called when the user has tapped the screen three times
  GestureTripleTapCallback? onTripleTap;

  @override
  void addAllowedPointer(PointerEvent event) {
    // Add the pointer to the gesture arena
    final entry = GestureBinding.instance.gestureArena.add(event.pointer, this);
    // Add the pointer to the pointer router
    GestureBinding.instance.pointerRouter
        .addRoute(event.pointer, _handleEvent, event.transform);

    // Keep track of the pointers
    if (firstPointer == null) {
      firstPointer = entry;
    } else if (secondPointer == null) {
      secondPointer = entry;
    } else {
      thirdPointer = entry;
    }
  }

  void _handleEvent(PointerEvent event) {
    if (event is PointerDownEvent) {
      _processPointerDownEvent(event);
    } else if (event is PointerUpEvent) {
      GestureBinding.instance.gestureArena.hold(event.pointer);
      _processPointerUpEvent(event);
    }
  }

  void _processPointerDownEvent(PointerDownEvent event) {
    _resetCountdown();
  }

  /// Handle the pointer up event
  /// If the user has tapped the screen three times, accept the gesture
  /// by using the resolve method of the
  void _processPointerUpEvent(PointerUpEvent event) {
    tapCounter++;
    if (tapCounter == 3) {
      _resetCounter();
      _stopCountdown();
      firstPointer?.resolve(GestureDisposition.accepted);
      secondPointer?.resolve(GestureDisposition.accepted);
      thirdPointer?.resolve(GestureDisposition.accepted);
    }
  }

  void _resetCountdown() {
    countdown?.cancel();
    countdown = Timer(countdownDuration, () {
      firstPointer?.resolve(GestureDisposition.rejected);
      secondPointer?.resolve(GestureDisposition.rejected);
      thirdPointer?.resolve(GestureDisposition.rejected);
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
    onTripleTap?.call();
    _resetPointers();
  }

  @override
  void rejectGesture(int pointer) {
    _resetPointers();
  }

  void _resetPointers() {
    tapCounter = 0;
    firstPointer = null;
    secondPointer = null;
    thirdPointer = null;
  }

  @override
  String get debugDescription => 'Triple Tap';

  @override
  void dispose() {
    _stopCountdown();
    super.dispose();
  }
}
