import 'package:flutter/material.dart';

class EditPhone extends StatelessWidget {

static const routeName = '/editMine';


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("设置电话"),
        leading: IconButton(
          icon: Image.asset('assets/home/left_back.png'),
          onPressed: () {
            Navigator.of(context).pop("a back detail message");
          },
        ),
        actions: [
          FlatButton(
            child: Text('完成'),
            onPressed: (){
              print('完成');
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left:15,right: 15,top: 15),
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            print('value change $value');
          },
          maxLength: 11,
          decoration: InputDecoration(
             focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff999999), width: 1))
          ),
        ),
      ),
    );
  }

}