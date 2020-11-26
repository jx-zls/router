import 'package:flutter/material.dart';

class Found_PW extends StatefulWidget {
  static const String routeName = "/found_pw";
  @override
  _FoundState createState() => _FoundState();
}

class _FoundState extends State<Found_PW> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name;
  String _password;

  @override
  Widget _foundContent(context) {
    return Container(
      color: Color(0xffefefef),
      child: Column(
        children: [
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
                      style: TextStyle(fontSize: 14, color: Color(0xff999999)),
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          hintText: '请输入手机号',
                          hintStyle: TextStyle(fontSize: 14, color: Color(0xff999999))
                      ),
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
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 0.0),
                          child: new TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            autofocus: false,
                            style: TextStyle(fontSize: 14, color: Color(0xff999999)),
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                hintText: '请输入密码',
                            ),
                            // onSaved: (value) => _userID = value.trim(),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: FlatButton(
                          child: Text('发送验证码', style: TextStyle(color: Color(0xFF986EF9), fontWeight: FontWeight.normal, fontSize: 14),),
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
                '下一步',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                print("object ======= ");
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('找回密码'),
        leading: IconButton(
          icon: Image.asset('assets/home/left_back.png'),
          onPressed: () {
            Navigator.of(context).pop("a back detail message");
          },
        ),
      ),
      body:  ListView.builder(
        itemCount: 1,
        itemBuilder: (context, idx) {
            return this._foundContent(context);
        })
    );
  }
}
