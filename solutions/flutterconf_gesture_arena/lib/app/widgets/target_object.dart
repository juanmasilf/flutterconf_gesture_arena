import 'package:flutter/material.dart';

class TargetObject extends StatelessWidget {
  const TargetObject({
    super.key,
    this.text = '',
    this.scale = 1.0,
  });

  final String text;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
      scale: scale,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(4, 4),
            ),
          ],
        ),
        width: 200,
        height: 200,
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
