import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {

  CollectionReference cart = FirebaseFirestore.instance.collection('cart');
  CollectionReference wishList = FirebaseFirestore.instance.collection('wishList');
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference checkOut = FirebaseFirestore.instance.collection('Check Out');
  Future<void> addUser({name,email,heigth,weight,gender,currentuserid})async {
    // Call the user's CollectionReference to add a new userflu
    return users
        .add({
      "Name":name.toString(),
      "Email":email.toString(),
      "Height":heigth,
      "Wiegth":weight,
      "Gender":gender.toString(),
      "uid":currentuserid
    })
        .then((value) => print("User ADDed "))
        .catchError((error) => print("Failed to add User: $error"));
  }

  Future<void> addItemToCart({name,uid,price,imagePass})async {
    // Call the user's CollectionReference to add a new userflu
    return cart
        .add({
      'Name': name.toString(),
      'ID':uid,
      'Price':price.toString(),
      'ImagePass':imagePass.toString()
          })
        .then((value) => print("Item to cart ADDed "))
        .catchError((error) => print("Failed to add item: $error"));
  }


  Future<void> wishlistAdd({name,uid,brand,imagePass})async {
    // Call the user's CollectionReference to add a new userflu
    return wishList
        .add({
      'Name': name.toString(),
      'uid':uid,
      'brand':brand.toString(),
      'ImagePass':imagePass.toString()
    })
        .then((value) => print("item to wishlist ADDed "))
        .catchError((error) => print("Failed to add feedback: $error"));
  }


  Future<void> addOrder({name,uid,price,address,phone})async {
    // Call the user's CollectionReference to add a new userflu
    return checkOut
        .add({
      'Name': name.toString(),
      'ID':uid,
      'Price':price.toString(),
      'adress':address.toString(),
      'Phone':phone,
    })
        .then((value) => print("Item to cart ADDed "))
        .catchError((error) => print("Failed to add item: $error"));
  }



}



