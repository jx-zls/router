import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:router/model/mine.dart';
import 'package:router/component/picker/c_picker.dart';
import 'package:router/common/global.dart';
import 'package:router/views/mine/editInfo/editPhone.dart';
import 'editInfo/case.dart';
const PickerData2 = [
  [1, 2, 3, 4]
];

class MineInfo extends StatelessWidget {
  static const String routeName = '/mineInfo';

  // MineInfo({Key key, @required this.model}):super(key:key);

  _tapAction(context, idx) {
    if (idx == 2) {
      CPciker.ShowPicker(
        context: context,
        data: ["男", "女"],
        title: '性别',
        contentColor: Colors.red,
        confirmPress: (picker, selecteds) {
          print('picker:$picker, selecteds: $selecteds');
        },
      );
    } else if (idx == 4) {
      CPciker.ShowPicker(
        context: context,
        data: ["缝制", "打版", "裁剪", "非标工艺"],
        title: '擅长领域',
        contentColor: Colors.red,
        confirmPress: (picker, selecteds) {
          print('picker:$picker, selecteds: $selecteds');
        },
      );
    } else if (idx == 5) {
      CPciker.ShowPicker(
        context: context,
        data: [1, 2, 3, 4, 5],
        title: '从业年限',
        contentColor: Colors.red,
        confirmPress: (picker, selecteds) {
          print('picker:$picker, selecteds: $selecteds');
        },
      );
    }else if(idx == 3){// 电话
    print('12345');
      G.getCurrentState().pushNamed(EditPhone.routeName);
    }else if(idx == 7){ // 设计案例
    G.getCurrentState().pushNamed(Case.routeName);
    }
  }

  Widget _cellContanier(context, title, value, idx) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            child: Container(
              child: Row(
                children: [
                  Text('$title'),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text('$value'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset('assets/home/right_back.png')
                ],
              ),
            ),
            onPressed: () {
              _tapAction(context, idx);
            },
          ),
          Divider(
            color: Color(0xffefefef),
          )
        ],
      ),
    );
  }

  Widget _mineContent(context) {
    final MineModel model = ModalRoute.of(context).settings.arguments;
    print("object $model");
    if (model.phone != '') {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Form(
          child: Column(children: [
            _cellContanier(context, '头像', '', 1),
            _cellContanier(context, '性别', model.sex, 2),
            _cellContanier(context, '电话', model.phone, 3),
            _cellContanier(context, '擅长领域', model.field, 4),
            _cellContanier(context, '从业年限', model.qualifications, 5),
            _cellContanier(context, '打样件数', model.number, 6),
            _cellContanier(context, '设计案例', model.defaultCase, 7),
            _cellContanier(context, '综合评分', model.score, 8)
          ]),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        leading: IconButton(
          icon: Image.asset('assets/home/left_back.png'),
          onPressed: () {
            Navigator.of(context).pop("a back detail message");
          },
        ),
      ),
      body: _mineContent(context),
    );
  }
}
