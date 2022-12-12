import 'package:flutter/material.dart';
//import 'package:untitled/widgets/Checkout_item.dart';
import 'cart.dart';
class OrderItem
{
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(this.id, this.amount, this.products, this.dateTime);
}

class Order with ChangeNotifier
{
 List<OrderItem> _orders=[];

 List<OrderItem> get orders{
   return [..._orders];
 }
  void addorder(List<CartItem> cartproducts,double  total)
  {
_orders.add(OrderItem(DateTime.now().toString(),total,cartproducts,DateTime.now()));

notifyListeners();
  }
  void removeorder(String orderid)
  {
    _orders.remove(orderid);
    notifyListeners();
  }

}