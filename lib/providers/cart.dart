import 'package:flutter/material.dart';

class CartItem
{
  final String id;
  final String title;
  final double price;
  final int quantity;
  final String imageurl;

  CartItem(this.id, this.title, this.price, this.quantity,this.imageurl);
}


class Cart with ChangeNotifier
{
Map<String,CartItem>? _items={};
Map<String,CartItem> get items
{
  return{..._items!};
}
int get  itemcount
{
  return _items ==null ? 0 : _items!.length;

}
double get totalamount
{
  var total=0.0;
  _items!.forEach((key, cartitem) {
    total+=cartitem.price*cartitem.quantity;
  });
  return total;
}
void addItem(String productid,String title,double price,String? image)
{
  if(_items!.containsKey(productid))
    {
      //change quantity
      _items!.update(productid, (value) => CartItem(value.id, value.title, value.price, value.quantity+1,value.imageurl));

    }
  else
    {
      _items!.putIfAbsent(productid,()=>CartItem(DateTime.now().toString(),title,price,1,image!));
    }
  notifyListeners();
}
void removeitem(String productid)
{
_items!.remove(productid);
notifyListeners();
}
void emptycart()
{
  _items={};
  notifyListeners();
}
}

