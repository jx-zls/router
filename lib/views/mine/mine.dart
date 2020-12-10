import 'package:flutter/material.dart';
import '../../network/home_request.dart';
import '../user/login.dart';
import 'address/address.dart';
import 'mineInfo.dart';
import 'package:router/model/mine.dart';
import 'package:router/network/home_request.dart';
import 'package:router/views/user/login.dart';

class Mine extends StatefulWidget {
  static const String routeName = "/mine";
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  HomeRequest request = HomeRequest();

  @override
  void initState() {
    super.initState();
    // this._getUserInfoData();
  }

  MineModel model;

  @override
  void didUpdateWidget(Mine oldWidget) {
    super.didUpdateWidget(oldWidget);
    this._getUserInfoData();
  }

  void _getUserInfoData() {
    request.getUserInfoByUserId(
        (result) => {
              setState(() {
                model = MineModel.passValue(result["userInfo"]);
              })
            },
        (err) => {print('err $err')});
  }

  var datas = [
    {"title": '我的消息', "icon": 'message'},
    {"title": '个人资料', "icon": 'info'},
    {"title": '地址管理', "icon": 'address'}
  ];

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return Scaffold(
        body: Center(
          child: Text('数据加载中'),
        ),
      );
    }
    return Scaffold(
      body: ListView.builder(
          itemCount: datas.length + 1,
          itemBuilder: (context, idx) {
            if (idx == 0) return _topView(context, model);
            return _cuscell(datas[idx - 1], idx, context);
          }),
    );
  }

  _toPushAction(ctx, idx) {
    final route = (idx == 2) ? MineInfo.routeName : Address.routeName;
    Navigator.of(ctx).pushNamed(route, arguments: model);
    // final back =  Navigator.of(ctx).push(MaterialPageRoute(
    //      builder: (ctx_s) {
    //       return Address();
    //     }
    //   ));

    //   back.then((value) => {
    //     print(value)
    //   });
  }

  Widget _topView(context, model) {
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
                      Text(model.phone,
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        decoration: BoxDecoration(
                          border:
                              new Border.all(color: Colors.white, width: .5),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          model.role,
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
              FlatButton(
                child: Image.asset(
                  'assets/mine/small_user.png',
                  width: 20,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Login.routeName, ModalRoute.withName(Login.routeName));
                  // Navigator.of(context).popUntil(ModalRoute.withName(Login.routeName));
                },
              ),
              SizedBox(
                height: 30,
                width: 20,
              )
            ],
          )
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
                onPressed: () => _toPushAction(context, idx),
              ),
            ),
            Divider(
              height: 1,
              color: Color(0XFFE4E4E4),
            )
          ],
        ));
  }
}
