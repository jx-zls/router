import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("订单管理")
      ),
      body: Center(child: Text('首页'),),
    );
  }
}