import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(child: _TopPart()),
              Expanded(child: Image.asset("asset/img/middle_image.png"))
            ],
          ),
        ),
      ),
    );
  }
}

class _TopPart extends StatefulWidget {
  const _TopPart({Key? key}) : super(key: key);

  @override
  State<_TopPart> createState() => _TopPartState();
}

class _TopPartState extends State<_TopPart> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "U&I",
          style: TextStyle(
              color: Colors.white, fontFamily: 'parisienne', fontSize: 80),
        ),
        Column(
          children: [
            Text(
              "우리 처음 만난 날",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',
                fontSize: 30,
              ),
            ),
            Text(
              "${selectedDate.year}.${selectedDate.month}.${selectedDate.day}",
              style: TextStyle(
                  color: Colors.white, fontFamily: 'sonflower', fontSize: 20),
            ),
          ],
        ),
        IconButton(
            iconSize: 60,
            onPressed: () {
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
                          maximumDate: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day),
                          onDateTimeChanged: (DateTime value) {
                            setState(() {
                              selectedDate = value;
                            });
                          },
                        ),
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            )),
        Text(
          "D+${DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).difference(selectedDate).inDays + 1}",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'sonflower',
              fontSize: 50,
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
