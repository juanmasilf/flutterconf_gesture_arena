import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TripleTapGestureDetector extends StatefulWidget {
  const TripleTapGestureDetector({
    required this.child,
    super.key,
    this.onTripleTap,
  });

  /// The callback that is called when the child is tapped with a triple tap.
  final VoidCallback? onTripleTap;

  /// The widget below this widget in the tree.
  final Widget child;

  @override
  State<TripleTapGestureDetector> createState() =>
      _TripleTapGestureDetectorState();
}

class _TripleTapGestureDetectorState extends State<TripleTapGestureDetector> {
  @override
  Widget build(BuildContext context) {
    // EXERCISE 1: Add the TripleTapGestureRecognizer to the gestures map
    return RawGestureDetector(
      child: widget.child,
    );
  }
}

/// Signature for when the user has tapped the screen three times
typedef GestureTripleTapCallback = void Function();

/// Implement here the TripleTapGestureRecognizer from exercise 1

/// Recognizes when the user has tapped the screen three times
class TripleTapGestureRecognizer extends GestureRecognizer {
  /// Called when the user has tapped the screen three times
  GestureTripleTapCallback? onTripleTap;

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
