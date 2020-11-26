import 'package:flutter/material.dart';
import 'package:router/component/address.dart';
import 'package:router/views/mine/address/editAddress.dart';

class Address extends StatelessWidget {
  static const String routeName = "/address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("地址管理"),
        leading: IconButton(
          icon: Image.asset('assets/home/left_back.png'),
          onPressed: () {
            Navigator.of(context).pop("a back detail message");
          },
        ),
      ),
      body: AddressList(),
    );
  }
}



class AddressList extends StatelessWidget {

 _addNewAddressAction(context, text){
    Navigator.of(context).pushNamed(EditAddress.routeName, arguments: text);
}

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height - 200),
              // height: 200,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, idx) {
                    return AddressCell('1234');
                  }),
            ),
            SizedBox(
              height: 10,
            ),
             Container(
                height: 40,
                width: (MediaQuery.of(context).size.width - 50),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff986EF9), Color(0xffFB5DA0)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: FlatButton(
                  child: Text('添加地址', style: TextStyle(color: Colors.white, fontSize: 16),),
                  onPressed: () {
                    _addNewAddressAction(context, '添加地址');
                  },
                ),
              ),
          ],
        ));
  }
}
