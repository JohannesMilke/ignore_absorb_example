import 'package:flutter/material.dart';

class AreaWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final VoidCallback onClicked;

  const AreaWidget({
    Key key,
    @required this.child,
    @required this.onClicked,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        child: child,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
      );
}
