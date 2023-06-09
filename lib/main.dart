
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/data/service/measuredata.dart';
import 'package:fashion_app/src/view/screen/home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/data/service/recommended.dart';
import 'src/data/service/shops_data.dart';
import 'src/view/screen/checkout_screen.dart';
import 'src/view/screen/dashbord.dart';
import 'src/view/screen/details/widgets/details_screen.dart';
import 'src/view/screen/favorite_tab.dart';
import 'src/view/screen/order_success_screen.dart';
import 'src/view/screen/recommended _screen.dart';
import 'src/view/screen/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Shop_data.MenData();
  RecommendedData.MenData();
  measuredata.MenData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SplashScreen(),

    );
  }
}
