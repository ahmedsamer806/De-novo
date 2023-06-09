import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/src/view/screen/CartScreen.dart';

import 'package:fashion_app/src/view/screen/component/carttab/cartitemsss.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScroll extends StatefulWidget {
  TextEditingController total;
  CartScroll(this.total);
  @override
  State<CartScroll> createState() => _CartScrollState(this.total);
}

class _CartScrollState extends State<CartScroll> {
  _CartScrollState(this.total);

  CollectionReference users = FirebaseFirestore.instance.collection('cart');
  List cur_user=[];
TextEditingController total;
  getData()async{
    var u1= await users.where('ID',isEqualTo:FirebaseAuth.instance.currentUser?.uid)
        .get();
    var v1=u1.docs;
    List temp=[];

    v1.forEach((element) {
      temp.add(element.data());
      try{
        setState(() {
          CartScreen.totalPrice+=int.parse(element['Price']);
          total.text=CartScreen.totalPrice.toString();
          print("here");
        });
      }catch(e){
        print(e);
      }
    });
    setState(() {
      cur_user=temp;
    });
    print(cur_user);
  }

  @override
  void initState(){
    this.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.8,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*.75,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 190/300),
              itemCount: cur_user.length,
              itemBuilder: (_, index) {
                return CartItem(
                    name: cur_user[index]['Name'],
                    price: cur_user[index]['Price'],
                    imagePass: cur_user[index]['ImagePass']
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text("Total price : ",
              style: TextStyle(
                  fontSize: 20
              ),),
            Text(total.text.toString(),
              style: TextStyle(
                  fontSize: 20
              ),),
          ],),
        ],
      ),
    );
  }
}
