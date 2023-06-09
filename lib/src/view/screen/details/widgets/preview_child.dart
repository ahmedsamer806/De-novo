import 'package:fashion_app/controller/handleFirestore.dart';
import 'package:fashion_app/src/view/screen/dashbord.dart';
import 'package:fashion_app/src/view/screen/details/widgets/coat_info.dart';
import 'package:fashion_app/src/view/screen/details/widgets/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/colors.dart';

class PreviewChild extends StatelessWidget {
  var name;
  var price;
  var image;

  FirestoreHelper firestoreHelper=FirestoreHelper();

  PreviewChild(this.name,this.price,this.image);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 190,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.bottomRight,
            child: ClipOval(
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                color: Colors.grey[350],
                child: IconButton(
                    onPressed: ()async {
                      firestoreHelper.wishlistAdd(
                        name: name,
                        imagePass: image,
                        brand: price,
                        uid: FirebaseAuth.instance.currentUser?.uid.toString(),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "This Item adding To Wish List.........",
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                      await Future.delayed(const Duration(seconds: 1), (){});


                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.black38,
                    )),
              ),
            ),
          ),
          Obx(() {
            return SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    height:
                        PageviewConnector.pageview.currentPage.value == index
                            ? 8
                            : 7,
                    width: PageviewConnector.pageview.currentPage.value == index
                        ? 8
                        : 7,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color:
                          PageviewConnector.pageview.currentPage.value == index
                              ? Colorz.ghostWhite
                              : Colorz.greyColor500,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            decoration: const BoxDecoration(
              color: Colorz.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 6,
                  width: 65,
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                    color: Colorz.greyColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CoatInfoWidget(this.name,this.price),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  width: 350,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: ()async {
                      firestoreHelper.addItemToCart(
                        name: name,
                        imagePass: image,
                        price: price,
                        uid: FirebaseAuth.instance.currentUser?.uid.toString(),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "This Item adding To Cart.........",
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                      await Future.delayed(const Duration(seconds: 1), (){});
                      Route route = MaterialPageRoute(builder: (context) => MyHomePage());
                      Navigator.pushReplacement(context, route);
                    },
                    child: const Text('Add to Cart'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
