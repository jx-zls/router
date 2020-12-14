import 'package:flutter/material.dart';
import 'package:router/common/global.dart';
import 'package:router/component/a_button/a_button.dart';
import 'package:router/component/server/s_detail.dart';

class ServerDetail extends StatelessWidget {
  static const routeName = 'serverDetail';
  final String serverId;
  ServerDetail({this.serverId});

  Widget build(BuildContext context) {
    Widget _childContainer(String text, {Color color, Color textColor}) {
      return Container(
        height: 10,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: color ?? Colors.red,
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      );
    }

    Widget _serverOrderInfo(BuildContext context, Object data) {
      return Column(
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              height: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '接单信息',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: GridView.count(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 3.0,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _childContainer('总结单 10单',
                              color: Color(0xFFF4F5FA),
                              textColor: Color(0xFF333333)),
                          _childContainer('总结单 11单',
                              color: Color(0xFFF4F5FA),
                              textColor: Color(0xFF333333)),
                          _childContainer('总结单 12单',
                              color: Color(0xFFF4F5FA),
                              textColor: Color(0xFF333333)),
                          _childContainer('总结单 13单',
                              color: Color(0xFAF4F4FF),
                              textColor: Color(0xffE60012)),
                          _childContainer('总结单 14单',
                              color: Color(0xFFF4F5FA),
                              textColor: Color(0xFF333333)),
                          _childContainer('总结单 15单',
                              color: Color(0xFFF4F5FA),
                              textColor: Color(0xFF333333)),
                        ]),
                  )
                ],
              )),
          Container(
            color: Color(0xffefefef),
            height: 15,
          )
        ],
      );
    }

    Widget _serverCell(BuildContext context, Object data) {
      return Container(
          color: Color(0xffefefef),
          child: Column(
            children: [
              Image.asset(
                'assets/server/s_detail.png',
                width: G.screenWidth(),
                fit: BoxFit.cover,
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '卓望科技有限公司(打样服务商)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        AButton.normal(
                            color: Color(0xFF986EF9),
                            bgColor: Colors.transparent,
                            child: Column(
                              children: [
                                Icon(Icons.phone),
                                Text(
                                  '电话',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            onPressed: () {
                              print('object');
                            })
                      ],
                    ),
                    Text('北京市海淀区'),
                    Text('联系人:李先生(打版师)')
                  ],
                ),
              ),
              Container(
                color: Color(0xffefefef),
                height: 15,
              ),
            ],
          ));
    }

    Widget _serverEvCell(BuildContext context, Object data) {

      return Container(
        padding: EdgeInsets.fromLTRB(15, 15, 15,0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '好评(10)',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                SDdetail.create().widget,
                SDdetail.create().widget,
                SDdetail.create().widget
              ],
            ),
           SizedBox(height: 10,),
            // Divider(color: Color(0xFFE4E4E4),)
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              color: Color(0xffefefef),
              height: G.screenPadding().top > 20
                  ? G.screenHeight() -
                      (G.screenPadding().top +
                          G.screenPadding().bottom +
                          45 +
                          60)
                  : G.screenHeight() - (G.screenPadding().top + 45 + 44),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, idx) {
                    if (idx == 0) {
                      return _serverCell(context, {});
                    } else if (idx == 1) {
                      return _serverOrderInfo(context, {});
                    } else {
                      return _serverEvCell(context, {});
                    }
                    // return _serverCell(context, {});
                  })),
          Container(
            width: G.screenWidth(),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                    colors: [Color(0xff986EF9), Color(0xffFB5DA0)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
            ),
            height: 45,
           
            child: GestureDetector(
              child: Text('立即沟通', style: TextStyle(fontSize: 18, color: Colors.white),),
              onTapUp: (details) {
                print('立即沟通');
              },
            ),
          )
        ],
      
      )),
    
    );
  }
}
