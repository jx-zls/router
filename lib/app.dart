import 'package:flutter/material.dart';

import 'views/home/home.dart';
import 'views/order/order.dart';
import 'views/server/server.dart';
import 'views/server/serverDetail.dart';
import 'views/mine/mine.dart';
import 'root.dart';
import 'views/mine/address/address.dart';
import 'views/mine/address/editAddress.dart';
import 'views/user/login.dart';
import 'views/user/login_pw.dart';
import 'views/user/found_pw.dart';
import 'views/mine/mineInfo.dart';
import 'common/global.dart';
import 'views/mine/editInfo/editPhone.dart';
import 'views/mine/editInfo/case.dart';
import 'views/mine/editInfo/uploadCase.dart';
import 'package:router/routes/indes.dart';

final Router router = Router();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: G.navigatorKey,
      title: '样衣路由',
      theme: ThemeData(
          primaryColor: Colors.white,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent),
      home: Login(),
      initialRoute: '/',
       onGenerateRoute: router.getRoutes,
      // routes: {
      //   Login.routeName:(ctx)=>Login(),
      //   Login_PW.routeName:(ctx)=>Login_PW(),
      //   Found_PW.routeName:(ctx)=>Found_PW(),
        
      //   Root_V.routeName:(ctx)=>Root_V(),
      //   Mine.routeName:(ctx) => Mine(),
      //   MineInfo.routeName:(ctx)=>MineInfo(),
      //   Address.routeName:(ctx) => Address(),
      //   EditAddress.routeName:(ctx) => EditAddress(),
      //   EditPhone.routeName:(BuildContext context, { Object args }) => EditPhone(),
      //   Case.routeName:(BuildContext context, { Object args }) => Case(),
      //   UploadCase.routeName:(BuildContext context, { Object args }) => UploadCase(),
      //   ServerDetail.routeName:(BuildContext context, {arguments} ) =>ServerDetail(serverId:arguments),
      // },
    );
  }
}