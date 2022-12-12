import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/widgets/app_drawer.dart';
import '../providers/order.dart' show Order;
import '../widgets/order_item.dart';
class PlaceOrder extends StatelessWidget {
  static const routename='/orders';
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order=Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(itemBuilder:(ctx,i) =>OrderItem(orderItem:order.orders.toList()[i]) ,itemCount:order.orders.length),
    );
  }
}
