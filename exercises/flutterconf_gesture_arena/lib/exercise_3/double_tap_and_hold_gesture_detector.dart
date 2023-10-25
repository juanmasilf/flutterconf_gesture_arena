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
  // EXERCISE 3: Implement the DoubleTapAndHoldGestureRecognizers

  /// Called when the user has tapped two times and hold the screen
  GestureDoubleTapAndHoldCallback? onDoubleTapAndHold;

  /// Called when the hold ends
  GestureDoubleTapAndHoldCallback? onDoubleTapAndHoldEnd;

  @override
  void acceptGesture(int pointer) {
    // TODO: implement acceptGesture
  }

  @override
  // TODO: implement debugDescription
  String get debugDescription => throw UnimplementedError();

  @override
  void rejectGesture(int pointer) {
    // TODO: implement rejectGesture
  }
}
