import 'package:flutter/material.dart';
import 'package:router/common/global.dart';
import 'package:router/component/a_button/a_button.dart';
import 'package:router/model/address.dart';
import './serverDetail.dart';
import 'package:router/network/home_request.dart';
import 'package:router/model/serverModel.dart';


class Server extends StatefulWidget {

  @override
  _ServerState createState() => _ServerState();
}


class _ServerState extends State<Server> {
  @override
  List datas = [];
  void initState(){
    super.initState();
    loadAllDatas();
  }
  void loadAllDatas(){
    HomeRequest.getAllServiceProvider('', (result){
          setState(() {
            datas=result;
          });
        }, (err){
          print('err == 11 $err');
        });
  }
  void loadCollectionDatas(){
    print('loadCollectionDatas');
    HomeRequest.getStarProviderListByUserId((cresult){
      setState(() {
            datas=cresult;
      });
    }, (err){
       print('err == 11 $err');
    });
  }
  void loadCoopDatas(){
     HomeRequest.getCooperationerListByUserId((cresult){
      setState(() {
            datas=cresult;
      });
    }, (err){
       print('err == 11 $err');
    });
  }

  void changeCategory(value){
    print('changeCategory $value');
    if(value == 0){
      this.loadAllDatas();
    }else if(value == 1){
      this.loadCollectionDatas();
    }else if(value == 2){
      this.loadCoopDatas();
    }
  }

  

  Widget build(BuildContext context) {
    Widget _listCell(BuildContext context, ServerModel smodel) {
      Widget _imageWidget(BuildContext context, {String imgUrl}) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Image.asset(
            imgUrl,
            width: 120,
          ),
        );
      }

      Widget _childText(String data) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Color.fromRGBO(191, 164, 255, 0.1)),
          padding: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
          child: Text(
            data,
            style: TextStyle(color: Color(0xFF986EF9)),
          ),
        );
      }

      Widget _serverInfoWidget(BuildContext context, {ServerModel amodel}) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${amodel.serverAddress.userName}(${amodel.userRole})'),
              Row(
                children: [
                  Icon(
                    Icons.filter,
                    size: 14,
                    color: Color(0xFF986EF9),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '总接${amodel.servicerProvider.orderAll}单',
                    style: TextStyle(color: Color(0xFF986EF9), fontSize: 14),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '按时完成${amodel.servicerProvider.orderOntime}单',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
              Row(
                children: [
                  _childText('合格率${amodel.servicerProvider.orderQualified / amodel.servicerProvider.orderAll * 100}%'),
                  SizedBox(
                    width: 5,
                  ),
                  _childText('完成率${amodel.servicerProvider.orderOntime / amodel.servicerProvider.orderAll * 100}%')
                ],
              ),
              Text(
                '北京市海淀区',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        );
      }

      return Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        height: 180,
        decoration: BoxDecoration(color: Color(0xffefefef)),
        child: Container(
          height: 160,
          padding: EdgeInsets.all(15),
          // ,
          child: Row(
            children: [
              _imageWidget(context, imgUrl: 'assets/mine/small_user.png'),
              _serverInfoWidget(context, amodel: smodel)
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(),
        elevation: 0,
        actions: [
          AButton.normal(
            child: Row(
              children: [
                Icon(
                  Icons.filter,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text('筛选')
              ],
            ),
            onPressed: () {
              print('筛选');
            },
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Container(
              height: 80,
              width: G.screenWidth(),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                color: Colors.white,
                ),
              child: TabBar(
                  tabs: [Text('全部服务商'), Text('收藏服务商'), Text('合作服务商')],
                  indicatorWeight: 2,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Color(0xff986EF9),
                  labelColor: Color(0xff999999),
                  unselectedLabelColor: Color(0xff999999),
                  onTap: (value) {
                   changeCategory(value);
                  }),
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: List.generate(3, (index) {
                  return ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, idx) {
                        return GestureDetector(
                            child: _listCell(context, datas[idx]),
                            onTapUp: (detail) {
                              Navigator.of(context).pushNamed(
                                  ServerDetail.routeName,
                                  arguments: '我是serverId');
                            });
                      });
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
