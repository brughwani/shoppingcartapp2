import 'package:flutter/foundation.dart';

class Product with ChangeNotifier
{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageurl;
  bool isliked=false;

  Product(@required this.id,@required this.title,@required this.description,@required this.price,@required this.imageurl);
 void like()
 {
   isliked=!isliked;
   notifyListeners();
 }
}
