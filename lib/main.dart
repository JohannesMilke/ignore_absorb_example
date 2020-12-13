import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ignore_absorb_example/widget/area1_widget.dart';
import 'package:ignore_absorb_example/widget/area2_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Ignore VS Absorb';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSecondExample = false;
  bool isAbsorbing = false;
  bool isIgnoring = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Builder(
          builder: (context) => Column(
            children: [
              Spacer(),
              buildExample(),
              Spacer(),
              buildSwitches(),
              const SizedBox(height: 72),
            ],
          ),
        ),
      );

  Widget buildExample() {
    if (isSecondExample) {
      return Column(
        children: [
          Text(
            'GestureDetector\n Around Button',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Area2Widget(
            isAbsorbing: isAbsorbing,
            isIgnoring: isIgnoring,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            'Stack With Two Buttons',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Area1Widget(
            isAbsorbing: isAbsorbing,
            isIgnoring: isIgnoring,
          ),
        ],
      );
    }
  }

  Widget buildSwitches() => Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            buildStatus(),
            const SizedBox(height: 32),
            buildExampleSwitch(),
            const SizedBox(height: 16),
            buildAbsorbSwitch(),
            const SizedBox(height: 16),
            buildIgnoreSwitch(),
          ],
        ),
      );

  Widget buildExampleSwitch() => Row(
        children: [
          Expanded(
            child: Text(
              '${isSecondExample ? 'Second' : 'First'} Example',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Transform.scale(
            scale: 1.2,
            child: CupertinoSwitch(
              value: isSecondExample,
              onChanged: (value) => setState(() {
                isSecondExample = value;
                isIgnoring = false;
                isAbsorbing = false;
              }),
            ),
          ),
        ],
      );

  Widget buildAbsorbSwitch() => Row(
        children: [
          Expanded(
            child: Text(
              'Is Absorbing?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Transform.scale(
            scale: 1.2,
            child: CupertinoSwitch(
              value: isAbsorbing,
              onChanged: (value) => setState(() {
                isAbsorbing = value;

                if (value) {
                  isIgnoring = false;
                }
              }),
            ),
          ),
        ],
      );

  Widget buildIgnoreSwitch() => Row(
        children: [
          Expanded(
            child: Text(
              'Is Ignoring?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Transform.scale(
            scale: 1.2,
            child: CupertinoSwitch(
              value: isIgnoring,
              onChanged: (value) => setState(() {
                isIgnoring = value;

                if (value) {
                  isAbsorbing = false;
                }
              }),
            ),
          ),
        ],
      );

  Widget buildStatus() {
    final status = () {
      if (isIgnoring) {
        return 'Ignoring';
      } else if (isAbsorbing) {
        return 'Absorbing';
      } else {
        return 'Normal';
      }
    }();

    return Text(
      'Status: $status',
      style: TextStyle(fontSize: 32),
    );
  }
}
