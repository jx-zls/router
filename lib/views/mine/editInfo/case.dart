import 'package:flutter/material.dart';
import 'package:router/common/global.dart';
import 'uploadCase.dart';

class Case extends StatefulWidget {
  static const routeName = '/case';
  @override
  _CaseState createState() => _CaseState();
}

class _CaseState extends State<Case> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("案例展示"),
          leading: IconButton(
            icon: Image.asset('assets/home/left_back.png'),
            onPressed: () {
              Navigator.of(context).pop("a back detail message");
            },
          )),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this would produce 2 rows.
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,

                    // Generate 100 Widgets that display their index in the List
                    children: new List.generate(10, (index) {
                      return Container(
                        color: Colors.red,
                      );
                    }),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      color: Colors.blue,
                      child: FlatButton(
                        child: Text('上传案例', style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          G.getCurrentState().pushNamed(UploadCase.routeName);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
