import 'package:flutter/material.dart';
import 'package:task/chatroom.dart';
import 'package:task/main.dart';
import 'package:task/sharedpreferences.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create an account'),
              SizedBox(
                height: 40,
              ),
              Text('Name'),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: width / 1.2,
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black26, width: 0.5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1)))),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Password'),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: width / 1.2,
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black26, width: 0.5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1)))),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    UserData().addPassword(password);
                    print(username);
                    UserData().addUsername(username);
                  });
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatRoom()));
                },
                child: Container(
                    height: 40,
                    width: width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange),
                    child: Center(
                        child: Text(
                      'Signup',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ))),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 6,
                  ),
                  Text(' Already sing in? '),
                  SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Text('Sign in',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
