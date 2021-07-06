import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/main.dart';
import 'package:task/sharedpreferences.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  void initState() {
    UserData().getStringValuesSF();
    super.initState();
  }

  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('ChatRoom'),
      ),
      body: Center(
          child: FutureBuilder(
              future: UserData().getStringValuesSF(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data['username']} Welcome chatroom');
                } else {
                  return Text('no data');
                }
              })),
    );
  }
}
