import 'package:flutter/material.dart';
import 'package:router/component/order.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context);
    return Scaffold(appBar: AppBar(title: Text("订单管理")), body: TabDemo());
  }
}

class TabDemo extends StatelessWidget {
  final List datas = [
    "全部",
    "已发单",
    "待推送",
    "待支付",
    "待接单",
    "已接单",
    "制作中",
    "待发货",
    "已发货",
    "已收货",
    "已完成"
  ];

  List<Widget> _createTabDatas() {
    List cusArr = <Widget>[];
    for (var i = 0; i < datas.length; i++) {
      cusArr.add(Tab(text: '${datas[i]}'));
    }
    return cusArr;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: datas.length,
      initialIndex: 0, // 默认选中第几项
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            title: TabBar(
              isScrollable: true,
              tabs: this._createTabDatas(),
              indicatorWeight: 2,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color(0xff000000),
              labelColor: Color(0xff000000),
              unselectedLabelColor: Color(0xff999999),
              onTap: (value) {
                print('value == $value');
              },
            ),
            automaticallyImplyLeading: false,
          ),
          preferredSize: Size.fromHeight(50.0),
        ),
        body: TabBarView(
          children: datas.map((e) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, idx) {
                return Container(
                  child: OrderCell(context, idx.toString()),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
