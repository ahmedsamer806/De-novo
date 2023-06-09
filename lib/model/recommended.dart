// To parse this JSON data, do
//
//     final recommended = recommendedFromJson(jsonString);

class Recommended {
  var id;
  var name;
  var gender;
  var category;
  var recommendedBrand;

  Recommended({
    required this.id,
    required this.name,
    required this.gender,
    required this.category,
    required this.recommendedBrand,
  });
}



