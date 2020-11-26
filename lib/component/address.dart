import 'package:flutter/material.dart';
import 'package:router/views/mine/address/editAddress.dart';

class AddressCell extends StatelessWidget {
  final String addressModel;
  AddressCell(this.addressModel);

  _toEditAction(model, context){
    Navigator.of(context).pushNamed(EditAddress.routeName, arguments: '编辑地址');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF986EF9), width: .5),
            color: Color(0xffefefef),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            '张晓晓',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('188xxxx3214'),
                          SizedBox(
                            width: 10,
                          ),
                          Offstage(
                            offstage: false,
                            child: Container(
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Color(0xFF986EF9),
                              ),
                              height: 20,
                              alignment: Alignment.center,
                              child: Text(
                                '默认',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text('北京市北京海淀区'),
                    Text('四季青镇西平庄和顺公寓203室')
                  ],
                ),
              ),
              FlatButton(
                child: Image.asset(
                  'assets/mine/edit.png',
                  width: 30,
                  color: Color(0xFF986EF9),
                ),
                onPressed: ()=>{
                  _toEditAction('1', context)
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

