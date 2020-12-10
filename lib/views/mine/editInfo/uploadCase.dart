import 'package:flutter/material.dart';

class UploadCase extends StatelessWidget {
  static const routeName = '/uploadCase';

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("上传案例"),
        leading: IconButton(
          icon: Image.asset('assets/home/left_back.png'),
          onPressed: () {
            Navigator.of(context).pop("a back detail message");
          },
        )
      ),
      body: Container(
      ),
    );
  
  }
}