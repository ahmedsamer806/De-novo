// To parse this JSON data, do
//
//     final shop = shopFromJson(jsonString);
import 'dart:convert';


class Shop {
  String id;
  String name;
  String price;
  String gender;
  var isLike=false;

  Shop({
    required this.id,
    required this.name,
    required this.price,
    required this.gender,
  });


}
