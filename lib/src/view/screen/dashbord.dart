

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/controller/authHelper.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/view/screen/foryou.dart';
import 'package:fashion_app/src/view/screen/home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'recommended _screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState(){
    AuthenticationHelper.getuser();
    super.initState();
  }
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomeTab(),HomeTab2(),HomeTab3()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    print(FirebaseFirestore.instance.collection('users')
        .where('Email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .snapshots());

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag,color:AppColors.primaryColorRed, ),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.category,color: AppColors.primaryColorRed, ),
            label: 'Styles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.real_estate_agent,color: AppColors.primaryColorRed,),
            label: 'For You',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

