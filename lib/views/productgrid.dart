import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/product.dart';
import 'package:untitled/views/Checkout.dart';
import '../providers/cart.dart';
import '../providers/products.dart';
import '../widgets/productitem.dart';
import 'package:badges/badges.dart';
import '../widgets/app_drawer.dart';
class ProductGrid extends StatefulWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  State<ProductGrid> createState() => _ProductGridState();
}
enum FilterOptions {Liked,All}
class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    var _showlikeditemsonly=false;
   //final prodcontainer=Provider.of<Products>(context,listen: false);
    return Scaffold(
      appBar: AppBar(

        title:Text("My Shop"),
      actions: [PopupMenuButton(
        onSelected: (FilterOptions selectedvalue)
          {
            setState(() {
              if(selectedvalue==FilterOptions.Liked)
              {
                //prodcontainer.showlikedonly();
                _showlikeditemsonly=true;
              }
              else
              {
                _showlikeditemsonly=false;
                //prodcontainer.showAll();
              }
            });
            //print(selectedvalue);
          },
          icon:Icon(Icons.more_vert),itemBuilder:(_)=>[
        PopupMenuItem(child:Text("Liked Items"),value:FilterOptions.Liked),
        PopupMenuItem(child:Text("All items"),value:FilterOptions.All),
      ]),
        Consumer<Cart>(builder:(_,cart,ch)=>Badge(badgeContent: Text(cart.items.length.toString()),child: IconButton(icon:Icon(Icons.shopping_cart),onPressed: () {
          Navigator.of(context).pushNamed(Checkout.routename);
        },)))
      ],),
      drawer: AppDrawer(),
      body: PGrid(showlikeditems: _showlikeditemsonly),
    );
  }
}

class PGrid extends StatelessWidget {
  const PGrid({Key? key, required this.showlikeditems}) : super(key: key);
  final bool showlikeditems;
  @override
  Widget build(BuildContext context) {
    final productdata=Provider.of<Products>(context);
    final pdata=showlikeditems?productdata.likeditems:productdata.items;
    return GridView.builder(gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10) ,
      itemBuilder:(ctx,i)=>
          ChangeNotifierProvider(
            create: (c)=> pdata[i],
            child:ProductItem(),
          ),//id: pdata[i].id, title:pdata[i].title, imageurl:pdata[i].imageurl)),
      padding: EdgeInsets.all(10),
      itemCount: pdata.length,);
  }
}

