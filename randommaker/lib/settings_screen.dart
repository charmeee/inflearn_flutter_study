import 'package:flutter/material.dart';
import 'package:randommaker_videoplayer/constant/color.dart';

import 'component/number_row.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key, required this.maxNumber}) : super(key: key);
  double maxNumber;
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  double maxNumber = 1000;
  void initState() {
    // TODO: implement initState
    super.initState();
    maxNumber = widget.maxNumber;
  }

  //double maxNumber = widget.maxNumber;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Body(maxNumber: maxNumber),
              _Footer(
                  onSliderChanged: onSliderChanged,
                  maxNumber: maxNumber,
                  onButtonPressed: onButtonPressed)
            ],
          ),
        ),
      ),
    );
  }

  onSliderChanged(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  onButtonPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Body extends StatelessWidget {
  _Body({Key? key, required this.maxNumber}) : super(key: key);
  double maxNumber;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: NumberRow(number: maxNumber.toInt()));
  }
}

class _Footer extends StatelessWidget {
  _Footer(
      {Key? key,
      required this.onSliderChanged,
      required this.maxNumber,
      required this.onButtonPressed})
      : super(key: key);
  final ValueChanged<double>? onSliderChanged;
  final double maxNumber;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: maxNumber,
          min: 1000,
          max: 1000000,
          onChanged: onSliderChanged,
        ),
        ElevatedButton(
          onPressed: onButtonPressed,
          child: Text("저장"),
          style: ElevatedButton.styleFrom(primary: RED_COLOR),
        )
      ],
    );
  }
}
