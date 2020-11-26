import 'package:flutter/material.dart';

class OrderCell extends StatelessWidget {
  final String addressModel;
  OrderCell(BuildContext context, this.addressModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('订单编号xs12345678'), Text('待接单')],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(children: [
              Container(
                color: Colors.purple,
                width: 60,
                height: 60,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '西装',
                            style: TextStyle(
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w500),
                          ),
                          Text('￥2222',
                              style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '贾小明',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text('大众花园10号', style: TextStyle(fontSize: 12))
                  ],
                ),
              )
            ]),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 90,
                height: 30,
                child: FlatButton(
                  child: Text(
                    '查看详情',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  ),
                  textColor: Color(0xff999999),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xffefefef),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {
                    print('查看详情');
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(
                  width: 60,
                  height: 30,
                  child: FlatButton(
                    child: Text('沟通',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    textColor: Color(0xff999999),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Color(0xffefefef),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      print('沟通');
                    },
                  ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 1,
            color: Color(0xff999999),
          )
        ],
      ),
    );
  }
}
