import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/product.dart';
import '../views/productdetail.dart';
import 'package:untitled/providers/cart.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

 // final String id;
  //final String title;
  //final String imageurl;

  //ProductItem(this.id,this.title,this.imageurl);

  @override
  Widget build(BuildContext context) {
  final   prod=Provider.of<Product>(context);
  final cart=Provider.of<Cart>(context);
    return GridTile(

        child:GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetail.routeName,arguments: prod.id );
          },
            child: Image.network(prod.imageurl,fit:BoxFit.cover)),
        footer:
        GridTileBar(title:Text(prod.title,textAlign: TextAlign.center),leading: IconButton(icon: Icon(prod.isliked?Icons.favorite:Icons.favorite_border),onPressed: () {
          prod.like();
        },),trailing: IconButton(icon:Icon(Icons.shopping_cart), onPressed: () { cart.addItem(prod.id, prod.title, prod.price,prod.imageurl); },),backgroundColor:Colors.black45));
  }
}
