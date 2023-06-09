import 'package:fashion_app/model/recommended.dart';

class RecommendedData{
  static List formal_Data=[];
  static List SMART_Data=[];
  static List uie_Data=[];
  static List sporty_Data=[];

  static List recommendData=[
  {
  "ID": 10,
  "Name": "Spring temptation fit",
  "Gender": "male",
  "Category": "Formal Outfits",
  "Recommended Brand": "Zara"
  },
  {
  "ID": 20,
  "Name": "Career woman fit",
  "Gender": "female",
  "Category": "Formal Outfits",
  "Recommended Brand": "Zara"
  },
  {
  "ID": 30,
  "Name": "Boss fit",
  "Gender": "female",
  "Category": "Formal Outfits",
  "Recommended Brand": "Zara"
  },
  {
  "ID": 40,
  "Name": "Day outfit",
  "Gender": "male",
  "Category": "Formal Outfits",
  "Recommended Brand": "Zara"
  },
  {
  "ID": 50,
  "Name": "Night outfit",
  "Gender": "female",
  "Category": "Formal Outfits",
  "Recommended Brand": "Zara"
  },
  {
  "ID": 60,
  "Name": "Boss lifestyle",
  "Gender": "male",
  "Category": "Formal Outfits",
  "Recommended Brand": "Zara"
  },
  {
  "ID": 70,
  "Name": "Fitness passion",
  "Gender": "female",
  "Category": "Sporty Outfits",
  "Recommended Brand": "Nike"
  },
  {
  "ID": 80,
  "Name": "Gym addict",
  "Gender": "male",
  "Category": "Sporty Outfits",
  "Recommended Brand": "Nike"
  },
  {
  "ID": 90,
  "Name": "Gymnast",
  "Gender": "female",
  "Category": "Sporty Outfits",
  "Recommended Brand": "Nike"
  },
  {
  "ID": 100,
  "Name": "Athlete fit",
  "Gender": "male",
  "Category": "Sporty Outfits",
  "Recommended Brand": "Nike"
  },
  {
  "ID": 110,
  "Name": "Gym Fit",
  "Gender": "male",
  "Category": "Sporty Outfits",
  "Recommended Brand": "Nike"
  },
  {
  "ID": 120,
  "Name": "Teen Wolf",
  "Gender": "female",
  "Category": "Sporty Outfits",
  "Recommended Brand": "Nike"
  },
  {
  "ID": 130,
  "Name": "Basic fit",
  "Gender": "female",
  "Category": "Uni outfits",
  "Recommended Brand": "H&M"
  },
  {
  "ID": 140,
  "Name": "College fit",
  "Gender": "female",
  "Category": "Uni outfits",
  "Recommended Brand": "Pull&Bear"
  },
  {
  "ID": 150,
  "Name": "Black fit",
  "Gender": "male",
  "Category": "Uni outfits",
  "Recommended Brand": "Pull&Bear"
  },
  {
  "ID": 160,
  "Name": "Wide jeans",
  "Gender": "female",
  "Category": "Uni outfits",
  "Recommended Brand": "Bershka"
  },
  {
  "ID": 170,
  "Name": "black and blue",
  "Gender": "male",
  "Category": "Uni outfits",
  "Recommended Brand": "Bershka"
  },
  {
  "ID": 180,
  "Name": "white fit",
  "Gender": "female",
  "Category": "Uni outfits",
  "Recommended Brand": "Bershka"
  },
  {
  "ID": 190,
  "Name": "autumn outfit",
  "Gender": "male",
  "Category": "Smart-Casual Outfits",
  "Recommended Brand": "H&M"
  },
  {
  "ID": 200,
  "Name": "weekend fit",
  "Gender": "male",
  "Category": "Smart-Casual Outfits",
  "Recommended Brand": "H&M"
  },
  {
  "ID": 210,
  "Name": "weekday fit",
  "Gender": "female",
  "Category": "Smart-Casual Outfits",
  "Recommended Brand": "Pull&Bear"
  },
  {
  "ID": 220,
  "Name": "spring fit",
  "Gender": "female",
  "Category": "Smart-Casual Outfits",
  "Recommended Brand": "Bershka"
  },
  {
  "ID": 240,
  "Name": "pinky shirt fit",
  "Gender": "female",
  "Category": "Smart-Casual Outfits",
  "Recommended Brand": "Bershka"
  }
  ];

  static MenData(){

    Recommended temp;
    recommendData.forEach((element) {
      temp=new Recommended(
          name: element['Name'].toString(),
          id:element['ID'].toString() ,
          recommendedBrand: element['Recommended Brand'].toString(),
          gender: element['Gender'].toString(),
        category: element["Category"].toString(),
      );
      print(temp.name);
      if(temp.category.toString()=='Smart-Casual Outfits')
        SMART_Data.add(temp);
      else if (temp.category.toString()=='Uni outfits')
        uie_Data.add(temp);
      else if (temp.category.toString()=='Sporty Outfits')
        sporty_Data.add(temp);
      else
        formal_Data.add(temp);
    });
  }

}