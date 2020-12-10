import 'package:flutter/material.dart';
import 'login_pw.dart';
import 'package:router/root.dart';
import 'package:router/component/dialog/c_dialog.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name;
  String _password;

  @override
  Widget _loginContent(context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, idx) {
          return Container(
            color: Color(0xffefefef),
            height: (MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Container(
                  height: 150,
                  // color: Colors.red,
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '样衣路由系统',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                          child: new TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            style: TextStyle(fontSize: 15),
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: '请输入帐号',
                                icon: new Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                )),
                            // onSaved: (value) => _userID = value.trim(),
                          ),
                        ),
                        Divider(
                          height: 0.5,
                          indent: 16.0,
                          color: Colors.grey[300],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15.0, 15.0, 0.0, 0.0),
                                child: new TextFormField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 15),
                                  decoration: new InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '请输入验证码',
                                      icon: new Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      )),
                                  // onSaved: (value) => _userID = value.trim(),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: FlatButton(
                                child: Text(
                                  '发送验证码',
                                  style: TextStyle(
                                      color: Color(0xFF986EF9),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14),
                                ),
                                onPressed: () {
                                  print('发送验证码');
                                },
                              ),
                            )
                          ],
                        ),
                        Divider(
                          height: 0.5,
                          indent: 16.0,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color(0xFF986EF9)),
                  width: (MediaQuery.of(context).size.width - 50),
                  child: FlatButton(
                    child: Text(
                      '登录',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      ADialog.confirm(context,
                            title: '确认弹窗',
                            content: 'flutter_luckin_coffee是一个完整的flutter实战demo',
                            confirmButtonPress: () {
                              Navigator.pop(context);
                            }
                          );
                      // showDialog(
                      //     context: context,
                      //     barrierDismissible: false,
                      //     builder: (ctx) {
                      //       return AlertDialog(
                      //         title: Text('Dialog'),
                      //         content: Text(('Dialog content..')),
                      //         actions: <Widget>[
                      //           new FlatButton(
                      //             child: new Text("取消"),
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //           ),
                      //           new FlatButton(
                      //             child: new Text("确定"),
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //           ),
                      //         ],
                      //       );
                      //     });
                    
                    },
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 10, 30, 0),
                    child: FlatButton(
                      child: Text(
                        '使用密码登录',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                      ),
                      onPressed: () =>
                          {Navigator.of(context).pushNamed(Login_PW.routeName)},
                    ))
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: _loginContent(context),
    );
  }
}
