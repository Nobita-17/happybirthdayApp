import 'dart:math';

import 'package:flutter/material.dart';
import 'package:happybirthday/user.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:confetti/confetti.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen(
      {super.key,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.userName,
      required this.birthdayMessage});

  final Color color1;
  final Color color2;
  final Color color3;
  final String userName;
  final String birthdayMessage;

  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  final ConfettiController _controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    _controller.play(); // Auto-play the confetti when the screen is loaded
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Final Screen'),
      // ),
      body: Center(
        child: Container(
          // child: Text('${widget.color1},${widget.color2},${widget.color3}'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Happy Birthday ${widget.userName}",
                style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              ConfettiWidget(
                confettiController: _controller,
                  blastDirectionality: BlastDirectionality.explosive, // Angle of confetti blast
                emissionFrequency: 0.05, // How often confetti is released
                numberOfParticles: 60, // Number of confetti particles
                maxBlastForce: 50, // Maximum force applied to confetti
                minBlastForce: 20, // Minimum force applied to confetti
                gravity: 0.2, // Gravity applied to confetti
              ),
              SizedBox(height: 70),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: widget.color1, // Replace with the desired color
                ),
              ),
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  color: widget.color2, // Replace with the desired color
                ),
              ),
              Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  color: widget.color3, // Replace with the desired color
                ),
              ),
              SizedBox(height: 70),
              Text(
                " ${widget.birthdayMessage}",
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
