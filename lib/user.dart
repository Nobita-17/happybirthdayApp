import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:happybirthday/homscreen.dart';

class Userdetails extends StatefulWidget {
  const Userdetails({Key? key});

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  String userName = '';
  String birthdayMessage = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  bool flag= false;

  void Change(){
    if (userName.isNotEmpty && birthdayMessage.isNotEmpty) {
      setState(() {
        flag = true;
      });
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please provide both a name and a birthday message."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (flag== true) {
      return HomeScreen(userName: userName,
          birthdayMessage: birthdayMessage);
    }
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 500,
            width: 600,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  inputFormatters: [
                    // only accept letters from a to z
                    FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true)
                  ],
                  controller: nameController,
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Name",
                      helperText: 'Only accept letters from a to z',
                    border: OutlineInputBorder(),

                  ),
                ),
                SizedBox(
                  // width: 100,
                  height: 50,
                ),
                TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(200),
                  ],
                  controller: messageController,
                  onChanged: (value) {
                    setState(() {
                      birthdayMessage = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Enter Birthday Message",
                      helperText: 'Only 200 characters allowed',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(
                  // width: 100,
                  height: 50,
                ),
                ElevatedButton(onPressed: Change, child: Text("Next")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
