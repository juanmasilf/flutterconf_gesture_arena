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
  /// EXERCISE 2: Implement the _ResponsiveTapGestureRecognizer
}
