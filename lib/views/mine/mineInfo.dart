import 'package:flutter/material.dart';

class MineInfo extends StatelessWidget {
  static const String routeName = '/mineInfo';

  _tapAction(idx){
    print('$idx');
  }

  Widget _cellContanier(title, value, idx) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            child:  Container(
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
            onPressed: (){
              _tapAction(idx);
            },
          ),
         Divider(
            color: Color(0xffefefef),
          )
        ],
      ),
    );
  }

  Widget _mineContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Form(
        child: Column(
          children: [
          _cellContanier('头像', '', 1),
          _cellContanier('性别', '', 2),
          _cellContanier('电话', '', 3),
          _cellContanier('擅长领域', '', 4),
          _cellContanier('从业年限', '', 5),
          _cellContanier('打样件数', '', 6),
          _cellContanier('设计案例', '', 7),
          _cellContanier('综合评分', '', 8)
        ]),
      ),
    );
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
      body: _mineContent(),
    );
  }
}
