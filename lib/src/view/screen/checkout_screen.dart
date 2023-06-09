import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatefulWidget {

  String name ;
  String address;
  String phones;
  CheckoutScreen({
    required this.name,
    required this.address,
    required this.phones,
});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState(
      name: name,
      address: address,
      phones: phones
  );
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('cart');
  String name ;
  String address;
  String phones;

  _CheckoutScreenState({
    required this.name,
    required this.address,
    required this.phones
});


  deleteData()async{
    var u1= await users.where('ID',isEqualTo:FirebaseAuth.instance.currentUser?.uid)
        .get();
    var v1=u1.docs;
    List temp=[];
    v1.forEach((element)async {
    await users.doc().delete();
    print("hehhehehehheheheheeh");
    });

  }

@override
void initStae(){
    deleteData();
    super.initState();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Checkout",
          style: AppFont.semiBold.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextHeader(title: "Shipping address"),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.1),
                      blurRadius: 1,
                      spreadRadius: 1,
                      offset: Offset(2, 2),
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name.toString(),
                        style: AppFont.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){

                        },
                        child: Text(
                          "Change",
                          style: AppFont.regular.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: AppColors.primaryColorRed),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    phones.toString(),
                    style: AppFont.regular.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    address.toString(),
                    style: AppFont.regular.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Cario Egypt",
                    style: AppFont.medium.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                buildTextHeader(title: "Payment"),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    "Change",
                    style: AppFont.regular.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: AppColors.primaryColorRed),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Order",
                  style: AppFont.medium.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: AppColors.primaryColorGray),
                ),
                Spacer(),
                Text(
                  "1",
                  style: AppFont.semiBold.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Delivery",
                  style: AppFont.medium.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: AppColors.primaryColorGray),
                ),
                Spacer(),
                Text(
                  "15/6",
                  style: AppFont.semiBold.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              height: 49,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryColorRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                    textStyle: AppFont.medium.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OrderSuccessScreen()));
                },// Navigator.pushNamed(context, OrderSuccessScreens),
                child: Text('Submit order'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextHeader({required String title}) {
    return Text(
      title,
      style:
          AppFont.semiBold.copyWith(fontWeight: FontWeight.bold, fontSize: 17),
    );
  }
}
