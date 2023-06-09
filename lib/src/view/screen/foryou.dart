import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/data/service/measuredata.dart';
import 'package:fashion_app/src/view/screen/CartScreen.dart';
import 'package:fashion_app/src/view/screen/component/hometab/body3.dart';
import 'package:flutter/material.dart';
import 'component/hometab/header2.dart';
import 'favorite_tab.dart';
import 'personal_tab.dart';
import 'splash_screen.dart';

class HomeTab3 extends StatefulWidget {

  @override
  _HomeTab3State createState() => _HomeTab3State();
}

class _HomeTab3State extends State<HomeTab3> {

  @override
  void initState() {
    // TODO: implement initState
    measuredata.MenData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        foregroundColor: AppColors.primaryColorRed,
        elevation: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HeaderPage2(),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                BodyPage3(),
              ],
            ),
          ),
        ),

      ),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30,horizontal: 8),
          child: ListView(
            children: [
              ListTile(
                leading: CircleAvatar
                  (
                  radius: 120,
                  backgroundColor: Colors.transparent,
                  child: Image.asset("assets/image/logo.png",fit: BoxFit.cover,),
                ),
              ),
              Center(
                child: ListTile(
                  subtitle: Text("Shop Till you Drop"),
                ),
              ),
              Divider(),
              Card(
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PersonalTab()));
                  },
                  child: ListTile(
                    leading: Icon(Icons.person,color: AppColors.primaryColorRed),
                    title: Text("Your profile"),
                  ),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>CartScreen() ));
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart,
                      color: AppColors.primaryColorRed,),
                    title: Text("Shopping Cart"),
                  ),
                ),
              ),
              Divider(),
              GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FavoriteTab()));
                  },

                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite,color: AppColors.primaryColorRed),
                    title: Text("Wishing List"),
                  ),
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => SplashScreen()),
                          (Route<dynamic> route) => false
                  );
                },
                child: Card(

                  child: ListTile(
                    leading: Icon(Icons.logout,color: AppColors.primaryColorRed),
                    title: Text("Sign out"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
