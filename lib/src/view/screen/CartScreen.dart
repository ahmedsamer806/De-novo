import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/view/screen/add_address_screen.dart';
import 'package:fashion_app/src/view/screen/component/carttab/cartScroll.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static int totalPrice=0;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController total=TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('cart');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorRed,
        title: Text(
          "Shopping Cart",
          style: TextStyle(
              fontSize: 20
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height:700,
                  child:
                      CartScroll(total),
                ),
                 SizedBox(height: 10,),
                 SizedBox(
                  width: 380,

                  child: Column(
                    children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primaryColorRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                        onPressed: ()async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddAddressScreen()));
                        },
                        child: Text(
                          "Check Out".toUpperCase(),
                          style: AppFont.medium
                              .copyWith(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
          ],
        ),

      ),
    );
  }
}
