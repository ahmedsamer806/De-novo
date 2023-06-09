import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'favorite_item.dart';

class FavoriteScroll extends StatefulWidget {
  @override
  State<FavoriteScroll> createState() => _FavoriteScrollState();
}

class _FavoriteScrollState extends State<FavoriteScroll> {
  CollectionReference users = FirebaseFirestore.instance.collection('wishList');
   List cur_user=[];

  getData()async{
    var u1= await users.where('uid',isEqualTo:FirebaseAuth.instance.currentUser?.uid)
        .get();
    var v1=u1.docs;
    List temp=[];
    v1.forEach((element) {
        temp.add(element.data());
    });
    setState(() {
      cur_user=temp;
    });
    print(cur_user);
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 190/300),
        itemCount: cur_user.length,
        itemBuilder: (_, index) {
          return FavoriteItem(
            name: cur_user[index]['Name'],
            price: cur_user[index]['brand'],
              imagePass: cur_user[index]['ImagePass']
          );
        },
      ),
    );
  }
}
