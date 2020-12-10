import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class CPciker {
  static void ShowPicker(
    {
       BuildContext context,
        List data,
        PickerConfirmCallback confirmPress,
        Color bgColor,
        Color contentColor,
        String title
    }
  ){
    Picker(
      adapter: PickerDataAdapter(pickerdata: data),
      changeToFirst: true,
      hideHeader: false,
      title: Text(title),
      cancelText: '取消',
      confirmText: '确认',
      cancelTextStyle: TextStyle(color: Color(0xFF333333), fontSize: 16),
      confirmTextStyle: TextStyle(color: Color(0xFF333333),fontSize: 16),
      textStyle: TextStyle(color: Colors.grey, fontSize: 14),
      selectedTextStyle: TextStyle(color:Color(0xFF333333), fontSize: 18),
      backgroundColor: Colors.white ?? bgColor,
      containerColor: Colors.white ?? contentColor,
      onConfirm: confirmPress
    ).showModal(context);
  }
}