 import "package:flutter/material.dart";
import '../views/place_order.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:[
          AppBar(title: Text("Good evening User"),automaticallyImplyLeading: false),
          Divider(),
          ListTile(leading: Icon(Icons.shop),title: Text("Shop"),
          onTap: (){
            Navigator.of(context).pushReplacementNamed("/");
          },),
          Divider(),
          ListTile(leading: Icon(Icons.credit_card),title: Text("Orders"),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(PlaceOrder.routename);
            },),
        ]
      ),

    );
  }
}
