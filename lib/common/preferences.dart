import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Perferences {
  saveUserData(userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userInfo', '1234');
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data =  prefs.getString("userInfo");
    if (data != null) {
      return json.decode(data);
    }
  }
}
