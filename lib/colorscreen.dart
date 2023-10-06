import 'package:flutter/material.dart';
import 'dart:math';



class Colorscreen extends StatefulWidget {
  const Colorscreen({super.key, required this.flag,required this.onSelectColor});

  final bool flag;
  final Function(Color) onSelectColor;   //when we call this function we have to pass the value of color

  @override
  State<Colorscreen> createState() => _ColorscreenState();
}

class _ColorscreenState extends State<Colorscreen> {
  Color cardcolor=Colors.grey;


  Color getRandomcolor(){
    final Random random=Random();
    int r=random.nextInt(256);
    int g=random.nextInt(256);
    int b=random.nextInt(256);

    return Color.fromARGB(255, r, g, b);
  }

  void change(){
    setState(() {
      if(widget.flag == true) {
        cardcolor = Colors.grey;
        print('chnage grey');
      } else {
        cardcolor = getRandomcolor();
        widget.onSelectColor(cardcolor);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: change,
      child: Card(
      color: cardcolor,
      margin: EdgeInsets.all(0.0),
      child: Container(
      width: 100,
      height: 60,
      ),
      ),
    );
  }
}
