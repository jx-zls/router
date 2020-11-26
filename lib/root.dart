import 'package:flutter/material.dart';
import 'views/home/home.dart';
import 'views/order/order.dart';
import 'views/server/server.dart';
import 'views/mine/mine.dart';

class Root_V extends StatefulWidget {
  static const String routeName = '/root';
  @override 
  _MyStackState createState() => _MyStackState();

}

class _MyStackState extends State<Root_V> {

  var _currentIndex = 0;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          selectedItemColor:Color(0xFF986EF9),
          // unselectedItemColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          items: [
            createItem("home", "首页"),
            createItem("order", "订单管理"),
            createItem("server", "服务商"),
            createItem("mine", "我的"),
          ],
          onTap: (idx){
            setState(() {
              _currentIndex = idx;
            });
          },
      ),
      body: IndexedStack(
            index: _currentIndex,
            children: [
              Home(),
              Order(),
              Server(),
              Mine(),
            ],
      )
    );
  }
}

BottomNavigationBarItem createItem(String iconName, String title) {
  return BottomNavigationBarItem(
      icon: Image.asset(
        "assets/home/${iconName}_u.png",
        width: 30,
      ),
      activeIcon: Image.asset(
        "assets/home/$iconName.png",
        width: 30,
      ),
      title: Text(title));
}
