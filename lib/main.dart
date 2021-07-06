import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/chatroom.dart';
import 'package:task/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String username = '';
  String Password = '';
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 20),
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign into your account'),
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
                              borderSide: BorderSide(
                                  color: Colors.black26, width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54, width: 1)))),
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
                          Password = value;
                        });
                      },
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black26, width: 0.5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black54, width: 1)))),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    //Return String
                    String stringValue = prefs.getString('username').toString();
                    String password = prefs.getString('password').toString();
                    print(stringValue);

                    if (stringValue == username && password == Password) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatRoom()));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Loging you in')));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('invalid')));
                    }
                  },
                  child: Container(
                      height: 40,
                      width: width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange),
                      child: Center(
                          child: Text(
                        'LOGIN',
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
                    Text('Dont have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text('Sign up',
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
      ),
    );
  }
}
