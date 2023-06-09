import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/controller/handleFirestore.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/view/screen/checkout_screen.dart';
import 'package:fashion_app/src/view/screen/component/addaddress/text_field_address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddAddressScreen extends StatefulWidget {
  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  FirestoreHelper check_out=FirestoreHelper();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressDetailController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('cart');

  deleteData()async {
    var u1 = await users.where(
        'ID', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
    var v1 = u1.docs;
    List temp = [];
    v1.forEach((element) async {
       await users.doc(element.id).delete();
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
          "Add Shipping Address",
          style: AppFont.semiBold.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFieldAddress(

                textEditingController: nameController,
                lableText: "Full name",
                ),
            SizedBox(
              height: 18,
            ),
            TextFieldAddress(
                textEditingController: phoneController,
                lableText: "Phone"),
            SizedBox(
              height: 18,
            ),
            TextFieldAddress(
                textEditingController: addressDetailController,
                lableText: "Address Description"),
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
                onPressed: () async{
                  Future.delayed(Duration(milliseconds: 50), ()async {
                    await check_out.addOrder(
                        name: nameController,
                        uid: FirebaseAuth.instance.currentUser?.uid,
                        address: addressDetailController,
                        phone: phoneController,
                        price: "1200"
                    );
                  });

                  await deleteData();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckoutScreen(
                        name:nameController.text,
                        address: addressDetailController.text,
                        phones: phoneController.text,
                      )));
                },
                child: Text('save address'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



