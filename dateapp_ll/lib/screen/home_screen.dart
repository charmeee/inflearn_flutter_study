import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                  child: _TopPart(
                selectedDate: selectedDate,
                onPressed: onHeartPressed,
              )),
              Expanded(child: Image.asset("asset/img/middle_image.png"))
            ],
          ),
        ),
      ),
    );
  }

  onHeartPressed() {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //width: 300,
              height: 300,
              color: Colors.white,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                maximumDate: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day),
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    selectedDate = value;
                  });
                },
              ),
            ),
          );
        });
  }
}

class _TopPart extends StatelessWidget {
  const _TopPart(
      {Key? key, required this.selectedDate, required this.onPressed})
      : super(key: key);
  final DateTime selectedDate;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "U&I",
          style: textTheme.headline1,
        ),
        Column(
          children: [
            Text(
              "우리 처음 만난 날",
              style: textTheme.bodyText1,
            ),
            Text(
              "${selectedDate.year}.${selectedDate.month}.${selectedDate.day}",
              style: textTheme.bodyText2,
            ),
          ],
        ),
        IconButton(
            iconSize: 60,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            )),
        Text(
          "D+${DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).difference(selectedDate).inDays + 1}",
          style: textTheme.headline2,
        ),
      ],
    );
  }
}
