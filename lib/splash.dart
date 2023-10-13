import 'package:flutter/material.dart';
import 'package:happybirthday/homscreen.dart';
import 'package:happybirthday/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showscreen = false;

  void navigate() {
    setState(() {
      showscreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showscreen == true) {
      return Userdetails();
    }

    return Scaffold(
      backgroundColor: Colors.white60,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Create Customise Birthday Wishes',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(10.0),
                ),
                child: Image.asset('image/birthday2.png'),
                width: 400,
                height: 225,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: navigate, child: Text("Start"))
            ],
          ),
        ),
      ),
    );
  }
}
