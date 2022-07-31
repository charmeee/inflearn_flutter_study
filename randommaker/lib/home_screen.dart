import 'dart:math';

import 'package:flutter/material.dart';
import 'package:randommaker_videoplayer/constant/color.dart';
import 'package:randommaker_videoplayer/settings_screen.dart';

import 'component/number_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> randomNumbers = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(onPressed: onSetting),
              _Body(randomNumbers: randomNumbers),
              _Footer(onPressed: onRandomnumGenerate)
            ],
          ),
        ),
      ),
    );
  }

  onRandomnumGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};
    while (newNumbers.length < 3) {
      newNumbers.add(rand.nextInt(maxNumber));
    }
    setState(() {
      randomNumbers = newNumbers.toList();
    });
  }

  onSetting() async {
    final result = await Navigator.of(context)
        .push<int>(MaterialPageRoute(builder: (BuildContext) {
      return SettingsScreen(maxNumber: maxNumber.toDouble());
    }));
    if (result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "랜덤 숫자 생성기",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30),
        ),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.settings,
              color: RED_COLOR,
            ))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  _Body({Key? key, required this.randomNumbers}) : super(key: key);
  List<int> randomNumbers;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: randomNumbers
                .asMap()
                .entries
                .map((e) => Padding(
                      padding: EdgeInsets.only(bottom: (e.key == 2) ? 2 : 16),
                      child: NumberRow(number: e.value.toInt()),
                    ))
                .toList()));
  }
}

class _Footer extends StatelessWidget {
  _Footer({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: RED_COLOR),
        child: Text('생성하기'),
        onPressed: onPressed,
      ),
    );
  }
}
