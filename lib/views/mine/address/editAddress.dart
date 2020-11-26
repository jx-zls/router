import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EditAddress extends StatelessWidget {
  static const String routeName = "/editAddress";
  // ModalRoute.of(context).settings.arguments
  @override
  Widget build(BuildContext context) {
      final message = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('$message'),
        leading: IconButton(
          icon: Image.asset('assets/home/left_back.png'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: AddressEdit(),
    );
  }
}

class AddressEdit extends StatelessWidget {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _name;
  String _password;
  String _address;
  String _detail;

  void _forSubmitted() {
    var _form = _formKey.currentState;

    if (_form.validate()) {
      _form.save();
      print(_name);
      print(_password);
      print(_address);
      print(_detail);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: _formKey,
              child: new Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: new InputDecoration(
                            hintText: "名字",
                          ),
                          onSaved: (val) {
                            _name = val;
                          },
                        ),
                        TextFormField(
                          decoration: new InputDecoration(
                            hintText: "联系电话",
                            // enabledBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Color(0xffB6B6B6), width: 0.5)),
                            // focusedBorder: OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //         color: Color(0xffFD3F2A), width: 1)),
                          ),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          validator: (val) {
                            return val.length < 4 ? "密码长度错误" : null;
                          },
                          onSaved: (val) {
                            _password = val;
                          },
                        ),
                        TextFormField(
                          decoration: new InputDecoration(
                            hintText: "地址选择器",
                          ),
                          obscureText: true,
                          validator: (val) {
                            return val.length < 4 ? "密码长度错误" : null;
                          },
                          onSaved: (val) {
                            _password = val;
                          },
                        ),
                        TextFormField(
                          decoration: new InputDecoration(
                            hintText: "请输入详细地址",
                          ),
                          obscureText: true,
                          validator: (val) {
                            return val.length < 4 ? "请输入详细地址" : null;
                          },
                          onSaved: (val) {
                            _password = val;
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  child: Text('保存'),
                  color: Color(0xff986EF9),
                  textColor: Colors.white,
                  onPressed: this._forSubmitted,
                ))
              ]),
            )
          ],
        ));
  }
}
