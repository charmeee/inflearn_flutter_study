import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  NumberRow({Key? key, required this.number}) : super(key: key);
  final int number;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map((e) => Image.asset(
                'assets/img/$e.png',
                width: 50,
                height: 70,
              ))
          .toList(),
    );
  }
}
