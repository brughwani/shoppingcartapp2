import 'dart:core';

import 'package:flutter/material.dart';
import 'product.dart';
class Products with ChangeNotifier
{
  List<Product> _items=[Product(
    'p1',
    'Red Shirt',
    'A red shirt - it is pretty red!',
    29.99,

    'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  ),
    Product(
      'p2',
      'Trousers',
      'A nice pair of trousers.',
      59.99,

      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      'p3',
      'Yellow Scarf',
      'Warm and cozy - exactly what you need for the winter.',
      19.99,

      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      'p4',
      'A Pan',
      'Prepare any meal you want.',
      49.99,
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
var _showlikedonly=false;
  List<Product> get items {
    if(_showlikedonly)
      {
        return _items.where((proditem)=>proditem.isliked).toList();
      }
    else
    {
      return [..._items];
    }
  }

  List<Product> get likeditems
  {
    return _items.where((element) => element.isliked).toList();
  }

  void showlikedonly()
  {
    _showlikedonly=true;
    notifyListeners();
}
void showAll()
{
  _showlikedonly=false;
  notifyListeners();
}
  void addproduct()
  {

    notifyListeners();
  }
}