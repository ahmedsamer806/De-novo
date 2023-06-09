import 'package:fashion_app/model/shop.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/data/service/shops_data.dart';
import 'package:fashion_app/src/view/screen/component/producttile/custom%20card.dart';
import 'package:fashion_app/src/view/screen/component/producttile/producttile.dart';
import 'package:fashion_app/src/view/screen/details/widgets/details_screen.dart';

import 'package:fashion_app/src/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';


class BodyPage extends StatefulWidget {

  @override
  _BodyPageState createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {

@override
void initState()
{
//  Shop_data.MenData();
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
          buildHeaderBody(title: "Men", description: "Super sale"),

          SizedBox(
            height: 20,
          ),
          SizedBox(
              height: cardWidth / 0.59,
              child: ListView.builder(
                itemCount:  Shop_data.mens.length,
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  Shop? product = Shop_data.mens![index];

                    //color: Colors.blue,
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              name:product!.name,
                              imagepass:"assets/image/"+product!.id+".png" ,
                              price: product.price,
                              product: product,
                            )));
                      },
                      child: CustomCard(
                        imageUrl: product!.id,
                        itemPrice: product!.price,
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
          buildHeaderBody(title: "Woman", description: "Super new"),

          SizedBox(
            height: 20,
          ),

          SizedBox(
              height: cardWidth / 0.59,
              child: ListView.builder(
                itemCount:  Shop_data.Womans.length,
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  Shop? product = Shop_data.Womans![index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(
                      name:product!.name,
                      imagepass:"assets/image/"+product!.id+".png" ,
                      price: product.price,
                      product: product,
                      )));
                    },
                    child: CustomCard(
                      imageUrl: product!.id,
                      itemPrice: product!.price,
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
              fontSize: 35,
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
