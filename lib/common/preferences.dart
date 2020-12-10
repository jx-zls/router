import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Perferences {
  saveUserData(userInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('saveUserData == ${json.encode(userInfo)}');
    prefs.setString('userInfo', json.encode(userInfo));
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data =  prefs.getString("userInfo");
    if (data != null) {
      return json.decode(data);
    }
  }
}
