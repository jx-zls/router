
import 'package:flutter/material.dart';
import 'package:router/component/a_button/a_button.dart';
import 'package:color_dart/color_dart.dart';

class ADialog {
  final BuildContext context;
  final String title;
  final String content;

  static Widget _title;
  static Widget _content;
  static Widget _bottom;    

// 提示弹窗

ADialog.alert(this.context, {
    this.title,
    @required this.content,
    Function confirmButtonPress,
    Text confirmButtonText,
  }) {
    _title = _initTitle();
    _content = _initContent();
    _bottom = _initBottom(
      confirmButtonPress: confirmButtonPress,
      confirmButtonText: confirmButtonText == null ? Text('确认') : confirmButtonText,
      confirmBorderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
    );
    _initDialog();
  }

ADialog.confirm(this.context, {
    this.title,
    @required this.content,
    Function confirmButtonPress,
    Text confirmButtonText,
    Function cancelButtonPress,
    Text cancelButtonText,
  }) {
    _title = _initTitle();
    _content = _initContent();

    _bottom = _initBottom(
      confirmButtonPress: confirmButtonPress,
      confirmButtonText: confirmButtonText == null ? Text('确认') : confirmButtonText,
      cancelButtonText: cancelButtonText == null ? Text('取消') : cancelButtonText,
      cancelButtonPress: cancelButtonPress,
      cancelBorderRadius: BorderRadius.only(bottomLeft: Radius.circular(4)),
      confirmBorderRadius: BorderRadius.only(bottomRight: Radius.circular(4))
    );

    _initDialog();
  }

_initDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, state) {
            return Dialog(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _title,
                    _content,
                    _bottom
                  ],
                )
              ),
            );
          }
        );
      }
    );
  }

Widget _initTitle() {
  return title == null ? Container() : Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 12),        
      child: Text(title, style: TextStyle(
        color: Colors.black26,
        fontSize: 16,
        fontWeight: FontWeight.bold
      )),
    );
}

Widget _initContent() {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 24,horizontal: 15),
      child: Text(content,
        style: TextStyle(
          color: Colors.black26,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
}

// 底部按钮
  // 如果 confirmButtonText || cancelButtonText 为null 代表不显示改按钮
  Widget _initBottom({
    Text confirmButtonText,
    Text cancelButtonText,
    Function confirmButtonPress,
    Function cancelButtonPress,
    BorderRadius cancelBorderRadius,
    BorderRadius confirmBorderRadius,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey))
      ),
      child: Row(
        children: <Widget>[
          // 取消按钮
          Container(
            child: cancelButtonText == null ? null : Expanded(child: 
              Container(
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: rgba(242, 242, 242,1))),
                ),
                child: AButton.normal(
                  child: cancelButtonText,
                  color: rgba(56, 56, 56, 1),
                  borderRadius: cancelBorderRadius,
                  onPressed: (){
                    if(cancelButtonPress == null) {
                      Navigator.pop(context);
                    } else {
                      cancelButtonPress();
                    }
                  }
                ),
              )
            ),
          ),
          // 确认按钮
          Container(
            child: confirmButtonText == null ? null : Expanded(
              child: AButton.normal(
                child: confirmButtonText,
                borderRadius: confirmBorderRadius,
                color: rgba(144, 192, 239, 1),
                onPressed: (){
                    if(confirmButtonPress != null) confirmButtonPress();
                    Navigator.pop(context);
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}
