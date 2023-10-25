import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResponsiveTapGestureDetector extends StatefulWidget {
  const ResponsiveTapGestureDetector({
    required this.child,
    super.key,
    this.onTap,
    this.onDoubleTap,
  });

  /// The callback that is called when the child is tapped with a single tap.
  final VoidCallback? onTap;

  /// The callback that is called when the child is tapped with a double tap.
  final VoidCallback? onDoubleTap;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<ResponsiveTapGestureDetector> createState() =>
      _ResponsiveTapGestureDetectorState();
}

class _ResponsiveTapGestureDetectorState
    extends State<ResponsiveTapGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        _ResponsiveTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
            _ResponsiveTapGestureRecognizer>(
          _ResponsiveTapGestureRecognizer.new,
          (_ResponsiveTapGestureRecognizer instance) {
            instance.onTap = widget.onTap;
          },
        ),
        DoubleTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(
          DoubleTapGestureRecognizer.new,
          (DoubleTapGestureRecognizer instance) {
            instance.onDoubleTap = widget.onDoubleTap;
          },
        ),
      },
      child: widget.child,
    );
  }
}

/// A custom tap gesture recognizer that accepts the gesture
/// after 150 milliseconds instead of 300 milliseconds.
/// This is done to make the gesture detector more responsive
/// than the default one
class _ResponsiveTapGestureRecognizer extends TapGestureRecognizer {
  _ResponsiveTapGestureRecognizer();

  /// Timer to keep track the time to declare the gesture as
  /// the winner of the arean
  Timer? _lastTapUpEvent;

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerDownEvent) {
      _lastTapUpEvent?.cancel();
      _lastTapUpEvent = null;
    }

    if (event is PointerUpEvent) {
      _lastTapUpEvent = Timer(
        const Duration(milliseconds: 150),
        () {
          try {
            resolve(GestureDisposition.accepted);
          } catch (_) {
            // Necessary to avoid null check operator exception
            // By forcing the gesture to be accepted in this point
            // is trying to access a null object. We can't deal with
            // this exception because it's a private method.
            // The exception doesn't affect the app's behavior
          }
        },
      );
    }
    super.handleEvent(event);
  }
}
