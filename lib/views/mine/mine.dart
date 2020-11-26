import 'package:flutter/material.dart';
import 'address/address.dart';
import 'mineInfo.dart';
Widget _topView() {
  return Container(
    height: 200,
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    color: Color(0xFF986EF9),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Image.asset(
                'assets/mine/small_user.png',
                width: 60,
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('13611282586',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: BoxDecoration(
                        border: new Border.all(color: Colors.white, width: .5),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        '需求方',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(
          'assets/mine/small_user.png',
          width: 20,
        ),
        SizedBox(height: 30, width: 20,)
        ],)
        
      ],
    ),
  );
}

Widget _cuscell(data, idx, context) {
  return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            child: FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/mine/${data["icon"]}.png',
                          width: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(data["title"])
                      ],
                    ),
                  ),
                  Image.asset('assets/home/right_back.png')
                ],
              ),
              onPressed: ()=>_toPushAction(context, idx),
            ),
          ),
          Divider(
            height: 1,
            color: Color(0XFFE4E4E4),
          )
        ],
      ));
}

  _toPushAction(ctx, idx){
    final route = (idx == 2) ? MineInfo.routeName : Address.routeName;
    Navigator.of(ctx).pushNamed(route);
  // final back =  Navigator.of(ctx).push(MaterialPageRoute(
  //      builder: (ctx_s) {
  //       return Address();
  //     }
  //   ));

  //   back.then((value) => {
  //     print(value)
  //   });
 }

class Mine extends StatelessWidget {
  var datas = [
    {"title": '我的消息', "icon": 'message'},
    {"title": '个人资料', "icon": 'info'},
    {"title": '地址管理', "icon": 'address'}
  ];
  static const String routeName = "/mine";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView.builder(
          itemCount: datas.length + 1,
          itemBuilder: (context, idx) {
            if (idx == 0) return _topView();
            return _cuscell(datas[idx - 1], idx, context);
          }),
    );
  }
}
