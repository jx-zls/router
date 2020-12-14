import 'package:flutter/material.dart';

import '../views/home/home.dart';
import '../views/order/order.dart';
import '../views/server/server.dart';
import '../views/server/serverDetail.dart';
import '../views/mine/mine.dart';
import '../root.dart';
import '../views/mine/address/address.dart';
import '../views/mine/address/editAddress.dart';
import '../views/user/login.dart';
import '../views/user/login_pw.dart';
import '../views/user/found_pw.dart';
import '../views/mine/mineInfo.dart';
import '../common/global.dart';
import '../views/mine/editInfo/editPhone.dart';
import '../views/mine/editInfo/case.dart';
import '../views/mine/editInfo/uploadCase.dart';


class Router {
  static final _routes = {    
       '/': (BuildContext context, { Object args }) => Login(),
        Login.routeName:(ctx, {Object args})=>Login(),
        Login_PW.routeName:(ctx, {Object args})=>Login_PW(),
        Found_PW.routeName:(ctx, {Object args})=>Found_PW(),
        
        Root_V.routeName:(ctx, {Object args})=>Root_V(),
        Mine.routeName:(ctx, {Object args}) => Mine(),
        MineInfo.routeName:(ctx, {Object args})=>MineInfo(),
        Address.routeName:(ctx, {Object args}) => Address(),
        EditAddress.routeName:(ctx, {Object args}) => EditAddress(),
        EditPhone.routeName:(BuildContext context, { Object args }) => EditPhone(),
        Case.routeName:(BuildContext context, { Object args }) => Case(),
        UploadCase.routeName:(BuildContext context, { Object args }) => UploadCase(),
        ServerDetail.routeName:(BuildContext context, {String args} ) =>ServerDetail(serverId: args,),
   
  };

  static Router _singleton;

  Router._internal();

  factory Router() {
    if(_singleton == null) {
      _singleton = Router._internal();
    }

    return _singleton;
  }

  /// 监听route
  Route getRoutes(RouteSettings settings) {
    String routeName = settings.name;
    final Function builder = Router._routes[routeName];

    print(settings);

    if(builder == null) {
      return null;
    } else {
      return MaterialPageRoute(
        settings: settings, 
        builder: (BuildContext context) => builder(context, args: settings.arguments)
      );
    }
  }
}
