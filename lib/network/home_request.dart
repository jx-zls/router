import '../common/preferences.dart';
import 'http_request.dart';
import 'http_request.dart';
import 'package:router/common/preferences.dart';

class HomeRequest {

   Future _getUserInfo(){
    return Perferences().getUserData();
  }

  void loginByName(name,password, successF, failureF) async {
    final url = ":9092/api/user/loginByName";
    final result = await HttpRequest.request(url, params: {'name':name, 'passWord':password});
      if(result["code"] == 200){
        successF(result["data"]);
      }else{
        print('result 2 === ');
        failureF();
      }
  }

  void getUserInfoByUserId(successF, failureF) async {
    final userInfo = await _getUserInfo();
    final url = ":9092/api/userInfor/getUserInfoByUserId";
    final arg = {'token':userInfo["token"],'userId':userInfo["id"]};
    final result = await HttpRequest.request(url, params:arg);
    if(result["code"] == 200){
      successF(result["data"]);
    }else{
      print('result getUserInfoByUserId');
      failureF();
    }
  }
}