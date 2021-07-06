import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  addUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
  }

  addPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', password);
  }

  Future<Map> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('username').toString();
    String password = prefs.getString('password').toString();
    print(stringValue + 'data from');
    Map<String, String> datamap = {
      'username': stringValue,
      'password': password
    };
    return datamap;
  }
}
