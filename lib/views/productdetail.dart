import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/products.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);
//final String title;
static const routeName='/product-detail';
  @override
  Widget build(BuildContext context) {
    final productid=ModalRoute.of(context)!.settings.arguments.toString();
    final loadedproduct=Provider.of<Products>(context).items.firstWhere((prod) => prod.id==productid);
    return Scaffold(appBar: AppBar(title: Text(loadedproduct.title))
      ,
    body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child:Image.network(loadedproduct.imageurl,fit:BoxFit.cover)
          ),
          SizedBox(height:10),
          Text('\$${loadedproduct.price}',style: TextStyle(fontSize: 20,color: Colors.grey)),
          SizedBox(width:10),
          Text(loadedproduct.description,style: TextStyle(fontSize: 20,color: Colors.grey))
        ],
      ),
    ),
    );
  }
}
