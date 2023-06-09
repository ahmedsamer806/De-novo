// To parse this JSON data, do
//
//     final measure = measureFromJson(jsonString);

import 'dart:convert';


class Measure {
  var id;
  var name;
  var weight;
  var gender;

  Measure({
    required this.id,
    required this.name,
    required this.weight,
    required this.gender,
  });


}
