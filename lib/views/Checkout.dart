import 'package:flutter/material.dart';
//import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/order.dart';
import '../providers/cart.dart';
import '../widgets/Checkout_item.dart';
class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);
  static const routename="/cart";

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Checkout"),),
      body:Center(
        child: Column(

          children: [Card(margin: EdgeInsets.all(10),child: Padding(padding: EdgeInsets.all(10),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

            Text("Total",style:TextStyle(fontSize:20)),
            Chip(label:Text("\$${cart.totalamount.ceil()}"),
                backgroundColor:Colors.orange),
              ElevatedButton(onPressed: (){Provider.of<Order>(context,listen: false).addorder(cart.items.values.toList(),cart.totalamount);
                cart.emptycart();
                }, child:Text("Place Order"))
            ],)
          ),
          ),
           Expanded(child: ListView.builder(itemCount:cart.itemcount,itemBuilder:(ctx,index)=>CheckoutItem(imageurl: cart.items.values.toList()[index].imageurl, title: cart.items.values.toList()[index].title, id: cart.items.values.toList()[index].id, price:cart.items.values.toList()[index].price, quantity:cart.items.values.toList()[index].quantity, productid:cart.items.keys.toList()[index],)))
          ],
        ),
      )
    );
  }
}
