import 'package:flutter/material.dart';

class SDdetail {

  Widget widget;
  SDdetail.create({Object data}) {
    widget = _initChildWidget();
  }

  Widget _initChildWidget(){
    return  Container(
              height: 200,
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('衬衣缝制', style: TextStyle(fontSize: 16),),
                    ],
                  ),
                  Text('版型正没有线头，赞'),
                  Container(
                    height: 100,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Image.asset(
                          'assets/server/s_detail.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          'assets/server/s_detail.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  ),
                  Divider(color: Color(0xffefefef),)
                ],
              ),
            );
  }
}
