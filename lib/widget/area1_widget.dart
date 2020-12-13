import 'package:flutter/material.dart';
import 'package:ignore_absorb_example/utils.dart';
import 'package:ignore_absorb_example/widget/area_widget.dart';
import 'package:ignore_absorb_example/widget/pointer_widget.dart';

class Area1Widget extends StatelessWidget {
  final bool isIgnoring;
  final bool isAbsorbing;

  const Area1Widget({
    Key key,
    @required this.isIgnoring,
    @required this.isAbsorbing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = () {
      if (isIgnoring) {
        return 'Blue receives taps!';
      } else if (isAbsorbing) {
        return 'Nobody receives taps!';
      } else {
        return 'Red receives taps!';
      }
    }();

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AreaWidget(
          onClicked: () =>
              Utils.showSnackBar(context, title: 'Blue received interaction'),
          child: Container(width: 200, height: 150),
          color: Colors.blue,
        ),
        PointerWidget(
          isIgnoring: isIgnoring,
          isAbsorbing: isAbsorbing,
          child: AreaWidget(
            onClicked: () =>
                Utils.showSnackBar(context, title: 'Red received interaction'),
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
