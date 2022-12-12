import 'package:flutter/material.dart';
import 'package:untitled/providers/cart.dart';
import 'package:untitled/views/Checkout.dart';
import 'package:untitled/views/place_order.dart';
import 'package:untitled/views/productdetail.dart';
import 'package:untitled/views/productgrid.dart';
import 'package:untitled/providers/products.dart';
import 'package:provider/provider.dart';
import '../providers/order.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
      create: (ctx)=>Products()),
      ChangeNotifierProvider(create:(c)=>Cart()),
      ChangeNotifierProvider(create: (ctx)=>Order())
      ],
      child: MaterialApp(
      title: 'MyShop',
      theme: ThemeData(

        primarySwatch: Colors.purple,

      ),
      home: ProductGrid(),
      routes: {
        ProductDetail.routeName :(ctx)=>ProductDetail(),
        Checkout.routename:(c)=>Checkout(),
        PlaceOrder.routename:(context)=>PlaceOrder()

      },
      )
    );
  }
}

