import '../common/preferences.dart';
import 'http_request.dart';
import 'http_request.dart';
import 'package:router/common/preferences.dart';

import 'package:router/model/serverModel.dart';

class HomeRequest {
static Future _getUserInfo(){
    return Perferences().getUserData();
  }

static  void loginByName(name,password, successF, failureF) async {
    final url = ":9092/api/user/loginByName";
    final result = await HttpRequest.request(url, params: {'name':name, 'passWord':password});
      if(result["code"] == 200){
        successF(result["data"]);
      }else{
        failureF();
      }
  }

static  void getUserInfoByUserId(successF, failureF) async {
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

  // 获取所有服务商
static  void getAllServiceProvider(search, successF, failureF) async {
    final userInfo = await _getUserInfo();
    final url = ":9092/api/service/getAllServiceProvider";
    final arg = {'token':userInfo["token"],'search':search};
    final result = await HttpRequest.request(url,params: arg);
    if(result["code"] == 200){
      final roleList = result["data"]["roleList"];
      List<ServerModel> serverList = [];
      for (var i = 0; i < roleList.length; i++) {
        serverList.add(ServerModel.passValue(roleList[i]));
      }
      successF(serverList);
      
    }else{
       print('failure getAllServiceProvider');
      failureF();
    }
  }

 


  // 收藏列表
static  void getStarProviderListByUserId(successF, failureF) async {
    final userInfo = await _getUserInfo();
    final url = ":9092/api/service/getStarProviderListByUserId";
    final arg = {'token':userInfo["token"],'userId':userInfo["id"]};
    final result = await HttpRequest.request(url,params: arg);
    if(result["code"] == 200){
      final roleList = result["data"]["collectionList"];
      List<ServerModel> serverList = [];
      for (var i = 0; i < roleList.length; i++) {
        serverList.add(ServerModel.passValue(roleList[i]));
      }
      print('getStarProviderListByUserId === $serverList');
      successF(serverList);
    }else{
       print('failure getStarProviderListByUserId');
      failureF();
    }
      
    
  }

 // 添加收藏
  void addStarProviderById(providerId) async {
final userInfo = await _getUserInfo();
    final url = ":9092/api/service/getAllServiceProvider";
    final arg = {'token':userInfo["token"],'userId':userInfo["id"], "providerId":providerId};
  }

  // 删除收藏
  void removeStarProviderById(providerId) async {
    final userInfo = await _getUserInfo();
    final url = ":9092/api/service/removeStarProviderById";
    final arg = {'token':userInfo["token"], 'userId':userInfo["id"], "providerId":providerId};
  }
  // 已合作服务商列表
static  void getCooperationerListByUserId(successF, failureF) async {
    final userInfo = await _getUserInfo();
    final url = ":9092/api/service/getCooperationerListByUserId";
    final arg = {'token':userInfo["token"],'userId':userInfo["id"]};
    final result = await HttpRequest.request(url,params: arg);
    if(result["code"] == 200){
      final roleList = result["data"]["cooperaterList"];
      print('getCooperationerListByUserIdroleList === $roleList');
      List<ServerModel> serverList = [];
      for (var i = 0; i < roleList.length; i++) {
        serverList.add(ServerModel.passValue(roleList[i]));
      }
      print('getCooperationerListByUserId === $serverList');
      successF(serverList);
    }else{
       print('failure getCooperationerListByUserId');
      failureF();
    }
  }
  // 获取服务商详情
  void getProviderDetail(id, type) async {
    final userInfo = await _getUserInfo();
    final url = ":9092/api/service/getProviderDetail";
    final arg = {'token':userInfo["token"],'userId':userInfo["id"], "providerId":id, "type":type};
  }

}