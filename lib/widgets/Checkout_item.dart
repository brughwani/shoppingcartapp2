import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
class CheckoutItem extends StatelessWidget {

  const CheckoutItem({Key? key, required this.imageurl, required this.title, required this.id, required this.price, required this.quantity, required this.productid}) : super(key: key);
  final String imageurl;
  final String productid;
  final String title;
  final String id;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color:Colors.red,
        child: Icon(Icons.delete,color:Colors.white,size:40),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 10,vertical:5),
      ),
direction: DismissDirection.endToStart,
      onDismissed: (direction){
        Provider.of<Cart>(context,listen: false).removeitem(productid);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical:5),
child: Padding(padding:EdgeInsets.all(10),
      child:ListTile(
        leading: CircleAvatar(child:Image.network(imageurl)),
        title:Text(title),
          isThreeLine: true,
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Text(price.toString()),
        Text("Total:\$${price*quantity}")
        ],

        ),
        trailing: Text("${quantity}x"),

)),
      ),
    );
  }
}
