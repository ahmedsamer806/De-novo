import 'package:fashion_app/controller/handleFirestore.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/view/screen/details/widgets/coat_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../dashbord.dart';
import '../themes/colors.dart';

class ExpandedChild extends StatelessWidget {
  FirestoreHelper firestoreHelper=FirestoreHelper();
  var name;
  var price;
  var image;
  ExpandedChild(this.name,this.price,this.image);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
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
                  ),
                ),
              ),
            ),
          ),
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
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      3,
                      (index) => Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: index == 0
                                ? Colorz.pinkColor
                                : Colors.grey[300]),
                        child: Text(
                          _dop[index],
                          style: TextStyle(
                              fontWeight: index == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Composition',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Country',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '100% polyester',
                      style: TextStyle(
                        fontSize: 16.5,
                        color: Colorz.greyColor500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'italy',
                      style: TextStyle(
                        fontSize: 16.5,
                        color: Colorz.greyColor500,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(vertical: 14),
                  child: const Text(
                    'Care',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Text(
                  "Our selection of clothes is not only stylish but also made from high-quality materials that are sure to last. Whether you're dressing up for a night out or lounging at home, we have something for every occasion.",
                  style: TextStyle(
                    fontSize: 15.5,
                    color: Colorz.greyColor500,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
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
  final List<String> _dop = ['Details', 'Orders', 'Payment'];
}
