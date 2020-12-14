import 'package:flutter/material.dart';
import 'found_pw.dart';
import 'package:router/network/home_request.dart';
import 'package:router/common/preferences.dart';
import 'package:router/root.dart';

class Login_PW extends StatefulWidget {
  static const String routeName = "/login_pw";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login_PW> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name;
  String _password;

  _userLogin(context, formk) {
  var _state2 = formk.currentState as FormState;
  if(_state2.validate()){
    _state2.save();

  HomeRequest.loginByName(_name, _password, (data) {
      Perferences().saveUserData(data);
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new Root_V()),
          (route) => route == null);
    }, (err) {
      print('error $err');
    });
  }else{
    print('验证失败');
  }
  }

  @override
  Widget _loginContent(context) {
    GlobalKey _formKey = new GlobalKey<FormState>();
    return Container(
      color: Color(0xffefefef),
      height: (MediaQuery.of(context).size.height),
      child: Column(
        children: [
          Container(
            height: 200,
            // color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              '样衣路由系统',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
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
                        validator: (v) {
                          return v.trim().length > 0 ? null : "用户名不能为空";
                        },
                        onSaved: (value){
                          _name = value;
                        },
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
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                          child: new TextFormField(
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              style: TextStyle(fontSize: 15),
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '请输入密码',
                                  icon: new Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  )),
                              validator: (v) {
                                return v.trim().length > 5 ? null : "密码不能少于6位";
                              },
                              onSaved: (value){
                                _password = value;
                              },
                              ),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: Icon(
                            Icons.save,
                            color: Color(0xff999999),
                          ))
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
                _userLogin(context, _formKey);
              },
            ),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    child: Text(
                      '忘记了?找回密码',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                    onPressed: () =>
                        {Navigator.of(context).pushNamed(Found_PW.routeName)},
                  ),
                  FlatButton(
                    child: Text(
                      '使用验证码登录',
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                    onPressed: () => {Navigator.of(context).pop()},
                  )
                ],
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          leading: IconButton(
            icon: Image.asset('assets/home/left_back.png'),
            onPressed: () {
              Navigator.of(context).pop("a back detail message");
            },
          ),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, idx) {
              return _loginContent(context);
            }));
  }
}
