import 'package:flutter/material.dart';
import 'package:ignore_absorb_example/widget/pointer_widget.dart';

import '../utils.dart';
import 'button_widget.dart';

class Area2Widget extends StatelessWidget {
  final bool isIgnoring;
  final bool isAbsorbing;

  const Area2Widget({
    Key key,
    @required this.isIgnoring,
    @required this.isAbsorbing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          buildArea(context),
          const SizedBox(height: 8),
          buildStatus(context),
        ],
      );

  Widget buildArea(BuildContext context) => GestureDetector(
        onTap: () => Utils.showSnackBar(context,
            title: 'Parent GestureDetector received interaction'),
        child: PointerWidget(
          isIgnoring: isIgnoring,
          isAbsorbing: isAbsorbing,
          child: ButtonWidget(
            text: 'Button',
            onClicked: () => Utils.showSnackBar(context,
                title: 'Button received interaction'),
          ),
        ),
      );

  Widget buildStatus(BuildContext context) {
    final status = () {
      if (isIgnoring) {
        return 'Nobody receives taps!';
      } else if (isAbsorbing) {
        return 'GestureDetector receives taps!';
      } else {
        return 'Button receives taps!';
      }
    }();

    return Text(
      '$status',
      style: TextStyle(fontSize: 20),
    );
  }
}
