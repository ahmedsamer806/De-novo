import 'package:fashion_app/model/shop.dart';

class Shop_data{

  static List mens=[];
  static List Womans=[];
  static List  row_data=[
    {
      "ID": 1,
      "Name ": "printed short sleeve shirt",
      "Price ": 500,
      "Gender ": "men"
    },
    {
      "ID": 2,
      "Name ": "Relaxed fit cargo trousers",
      "Price ": 1699,
      "Gender ": "men"
    },
    {
      "ID": 3,
      "Name ": "Slim fit cotton twill trousers",
      "Price ": 999,
      "Gender ": "men"
    },
    {
      "ID": 4,
      "Name ": "Oversized Fit satin baseball jacket",
      "Price ": 1999,
      "Gender ": "men"
    },
    {
      "ID": 5,
      "Name ": "StormMove Rain jacket",
      "Price ": 2499,
      "Gender ": "men"
    },
    {
      "ID": 6,
      "Name ": "Long sleeve polo te shirt",
      "Price ": 599,
      "Gender ": "women"
    },
    {
      "ID": 7,
      "Name ": "Basic puffer jacket with hood",
      "Price ": 1000,
      "Gender ": "women"
    },
    {
      "ID": 8,
      "Name ": "High waist flare jeans with rips",
      "Price ": 1799,
      "Gender ": "women"
    },
    {
      "ID": 9,
      "Name ": "Straight-leg high wasit jeans",
      "Price ": 1799,
      "Gender ": "women"
    },
    {
      "ID": 10,
      "Name ": "Rip-knit jumber",
      "Price ": 540,
      "Gender ": "women"
    },
    {
      "ID": 11,
      "Name ": "oversized hoodie",
      "Price ": 650,
      "Gender ": "women"
    },
    {
      "ID": 12,
      "Name ": "printed te shirt",
      "Price ": 400,
      "Gender ": "men"
    },
    {
      "ID": 13,
      "Name ": "Denim jacket with faux shearling",
      "Price ": 2399,
      "Gender ": "men"
    },
    {
      "ID": 14,
      "Name ": "Flex lived-in longer lenghth cargo short",
      "Price ": 550,
      "Gender ": "men"
    },
    {
      "ID": 15,
      "Name ": "Double-breasted tenchcoat",
      "Price ": 2499,
      "Gender ": "women"
    },
    {
      "ID": 16,
      "Name ": "Oversized zip-through hoodie",
      "Price ": 1099,
      "Gender ": "women"
    },
    {
      "ID": 17,
      "Name ": "Gathered bodycon dress",
      "Price ": 490,
      "Gender ": "women"
    },
    {
      "ID": 18,
      "Name ": "Bonfire fleece striped baja hoodie",
      "Price ": 550,
      "Gender ": "men"
    },
    {
      "ID": 19,
      "Name ": "Super soft colorblock t-shirt",
      "Price ": 450,
      "Gender ": "men"
    },
    {
      "ID": 20,
      "Name ": "Cotton resort shirt",
      "Price ": 400,
      "Gender ": "women"
    }
  ];

  static MenData(){
    List<Shop> s_list=[];
    Shop temp;
    row_data.forEach((element) {
      temp=new Shop(
          name: element['Name '].toString(),
          id:element['ID'].toString() ,
          price:element['Price '].toString(),
          gender: element['Gender '].toString()
      );
      print(temp.name);
      if(temp.gender.toString()=='men')
        mens.add(temp);
      else
        Womans.add(temp);
    });
  }

}

