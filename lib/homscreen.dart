import 'package:flutter/material.dart';

import 'colorscreen.dart';
import 'output.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.userName, required this.birthdayMessage})
      : super(key: key);

  String userName;
  String birthdayMessage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool continuecreen = false;

  Color selectedCakeColor1 = Colors.grey;
  Color selectedCakeColor2 = Colors.grey;
  Color selectedCakeColor3 = Colors.grey;
  bool flag = false;

  void updateCakeColor1(Color color) {
    setState(() {
      selectedCakeColor1 = color;
    });
    // print('color 1 $selectedCakeColor1');
  }

  void updateCakeColor2(Color color) {
    setState(() {
      selectedCakeColor2 = color;
    });
    // print('color 1 $selectedCakeColor2');
  }

  void updateCakeColor3(Color color) {
    setState(() {
      selectedCakeColor3 = color;
    });
    // print('color 1 $selectedCakeColor3');
  }

  void restart() {
    setState(() {
      flag = true;
    });
  }

  void finalcolors() {
    setState(() {
      continuecreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (continuecreen == true) {
      return FinalScreen(
        color1: selectedCakeColor1,
        color2: selectedCakeColor2,
        color3: selectedCakeColor3,
        userName: widget.userName,
          birthdayMessage: widget.birthdayMessage,

      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                child: const Text(
                  'Customize Your Birthday Cake',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: 100,
                  height: 50,
                  child: Colorscreen(
                    flag: flag,
                    onSelectColor: updateCakeColor1,
                  )),
              Container(
                  width: 150,
                  height: 100,
                  child: Colorscreen(
                    flag: flag,
                    onSelectColor: updateCakeColor2,
                  )),
              Container(
                  width: 200,
                  height: 150,
                  child:
                      Colorscreen(flag: flag, onSelectColor: updateCakeColor3)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100, // <-- Your width
                    height: 40,
                    child: ElevatedButton(
                      onPressed: finalcolors,
                      child: Text("Continue"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
