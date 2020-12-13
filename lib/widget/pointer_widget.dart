import 'package:flutter/material.dart';

class PointerWidget extends StatelessWidget {
  final Widget child;
  final bool isIgnoring;
  final bool isAbsorbing;

  const PointerWidget({
    Key key,
    @required this.isIgnoring,
    @required this.isAbsorbing,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isIgnoring) {
      return IgnorePointer(child: child);
    } else if (isAbsorbing) {
      return AbsorbPointer(child: child);
    } else {
      return child;
    }
  }
}
