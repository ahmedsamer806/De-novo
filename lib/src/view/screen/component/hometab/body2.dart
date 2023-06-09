import 'package:fashion_app/model/recommended.dart';
import 'package:fashion_app/model/shop.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/data/service/recommended.dart';
import 'package:fashion_app/src/data/service/shops_data.dart';
import 'package:fashion_app/src/view/screen/component/producttile/custom%20card.dart';
import 'package:fashion_app/src/view/screen/details/widgets/details_screen.dart';
import 'package:flutter/material.dart';


class BodyPage2 extends StatefulWidget {

  @override
  _BodyPage2State createState() => _BodyPage2State();
}

class _BodyPage2State extends State<BodyPage2> {

  @override
  void initState()
  {
    //RecommendedData.MenData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double cardWidth = ((MediaQuery.of(context).size.width - 40) / 2);
    //List productMens= Shop_data.MenData();
    print(Shop_data.mens.length);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeaderBody(title: "Formal", description: "Super sale"),

          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: cardWidth / 0.59,
              child: ListView.builder(
                itemCount:  RecommendedData.formal_Data.length,
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  Recommended? product = RecommendedData.formal_Data![index];
                  //color: Colors.blue,
                  return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          name:product!.name,
                          imagepass:"assets/image/recommended/"+product!.id+".png" ,
                          price: product.recommendedBrand,
                          product: product,
                        ))
                    );
                  },
                  child: CustomCard(
                      imageUrl:"recommended/"+product!.id.toString(),
                      itemPrice: product!.recommendedBrand,
                      itemName: product!.name,
                    ),
                  );
                },
              )
          ),
          SizedBox(
            height: 30,
          ),
          Divider(),
          buildHeaderBody(title: "Smart Casual", description: "Super new"),

          SizedBox(
            height: 20,
          ),

          SizedBox(
              height: cardWidth / 0.59,
              child: ListView.builder(
                itemCount:  RecommendedData.SMART_Data.length,
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  Recommended? product = RecommendedData.SMART_Data![index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            name:product!.name,
                            imagepass:"assets/image/recommended/"+product!.id+".png" ,
                            //assets/image/recommended
                            price: product.recommendedBrand,
                            product: product,
                          ))
                      );
                    },
                    child: CustomCard(
                      imageUrl: "recommended/"+product!.id.toString(),
                      itemPrice: product!.recommendedBrand,
                      itemName: product!.name,
                    ),
                  );
                },
              )
          ),
          Divider(),
          buildHeaderBody(title: "Uni", description: "Super new"),

          SizedBox(
            height: 20,
          ),

          SizedBox(
              height: cardWidth / 0.59,
              child: ListView.builder(
                itemCount:  RecommendedData.uie_Data.length,
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  Recommended? product = RecommendedData.uie_Data![index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            name:product!.name,
                            imagepass:"assets/image/recommended/"+product!.id+".png" ,
                            //assets/image/recommended
                            price: product.recommendedBrand,
                            product: product,
                          )));
                    },
                    child: CustomCard(
                      imageUrl: "recommended/"+product!.id.toString(),
                      itemPrice: product!.recommendedBrand,
                      itemName: product!.name,
                    ),
                  );
                },
              )
          ),
          Divider(),
          buildHeaderBody(title: "Sporty", description: "Super new"),

          SizedBox(
            height: 20,
          ),

          SizedBox(
              height: cardWidth / 0.59,
              child: ListView.builder(
                itemCount:  RecommendedData.sporty_Data.length,
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  Recommended? product = RecommendedData.sporty_Data![index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            name:product!.name,
                            imagepass:"assets/image/recommended/"+product!.id+".png" ,
                            //assets/image/recommended
                            price: product.recommendedBrand,
                            product: product,
                          )));
                    },
                    child: CustomCard(
                      imageUrl: "recommended/"+product!.id.toString(),
                      itemPrice: product!.recommendedBrand,
                      itemName: product!.name,
                    ),
                  );
                },
              )
          ),
        ],
      ),
    );
  }

  Widget buildHeaderBody({required String title,required String description}){
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,style: AppFont.bold.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 8,
            ),
            Text(description,style: AppFont.regular.copyWith(
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Text('Scroll ',style: AppFont.regular.copyWith(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),),
            Icon(Icons.arrow_forward,
              size: 13,)
          ],
        ),
      ],
    );
  }
}
