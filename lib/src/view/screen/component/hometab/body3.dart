import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/model/mesuares.dart';
import 'package:fashion_app/model/shop.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/data/service/measuredata.dart';
import 'package:fashion_app/src/data/service/shops_data.dart';
import 'package:fashion_app/src/view/screen/component/producttile/custom%20card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../details/widgets/details_screen.dart';

class BodyPage3 extends StatefulWidget {

  @override
  _BodyPage3State createState() => _BodyPage3State();
}

class _BodyPage3State extends State<BodyPage3> {


  static CollectionReference userr = FirebaseFirestore.instance.collection('users');
  var app_user;
  getuser()async{
    var u1= await userr.where('Email',isEqualTo: FirebaseAuth.instance.currentUser?.email.toString())
        .get();
    var v1=u1.docs;
    setState(() {
      app_user=u1.docs.first;
    });
  }
List productList=[];
  @override
  void initState(){
    getuser();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        productList=getList();
      });
      // Do something
    });


    double cardWidth = ((MediaQuery.of(context).size.width - 40) / 2);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          buildHeaderBody(title: "Your Outfits", description: "For your body shape"),
          SizedBox(
            height: 40,
          ),
          SizedBox(
              height: cardWidth / 0.59,
              child: ListView.builder(
                itemCount:  productList.length,
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  Measure? product = productList![index];
                  //color: Colors.blue,
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            name:product!.name.toString().length>16?product!.name.toString().substring(0,16)
                                :product!.name.toString(),
                            imagepass:"assets/image/measure/"+product!.id+".png" ,
                            price: product.weight,
                            product: product,
                          )));
                    },
                    child: CustomCard(
                      imageUrl: "measure/"+product!.id,
                      itemPrice: product!.weight,
                      itemName: product!.name,
                    ),
                  );
                },
              )
          ),
          SizedBox(
            height: 30,
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

  getList(){
    if (app_user['Gender']=='male'&& app_user['Wiegth']=='under')
      return measuredata.underAndmen;
    else if (app_user['Gender']=='male'&& app_user['Wiegth']=='mediam')
      return measuredata.tamamAndmen_Data;
    else if (app_user['Gender']=='male'&& app_user['Wiegth']=='over')
      return measuredata.overAndman_Data;
    else if (app_user['Gender']=='female'&& app_user['Wiegth']=='mediam')
      return measuredata.tammAndwoman_Data;
    else if (app_user['Gender']=='female'&& app_user['Wiegth']=='under')
      return measuredata.underAndwoman_Data;
    else
      return measuredata.overAndwoman;
  }

}
