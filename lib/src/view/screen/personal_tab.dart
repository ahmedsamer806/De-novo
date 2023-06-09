import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/controller/authHelper.dart';
import 'package:fashion_app/model/user.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PersonalTab extends StatefulWidget {
  @override
  _PersonalTabState createState() => _PersonalTabState();


}

class _PersonalTabState extends State<PersonalTab> {

  static CollectionReference userCeckout = FirebaseFirestore.instance.collection('');

  static var app_user;

  static Future getuser()async{
    var u1= await userCeckout.where('uid',isEqualTo: FirebaseAuth.instance.currentUser?.uid.toString())
        .get();
    var v1=await u1.docs;
    app_user=u1.docs.first.data();
  }


  @override
  void initState(){

    super.initState();
  }

  Map<String, String> listInfomation = {
    //'My orders': 'Already have 8 orders',
    'your weight': AuthenticationHelper.app_user["Wiegth"],
    'Height': AuthenticationHelper.app_user["Height"]+ " cm",
    'Gender': AuthenticationHelper.app_user["Gender"],
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorRed,
        elevation: 0,
      ),
      body:  Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                     image: DecorationImage(
                       image: AssetImage('assets/image/logo.png'),
                       fit: BoxFit.cover
                     ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AuthenticationHelper.app_user['Name'],
                          style: AppFont.semiBold.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          AuthenticationHelper.app_user['Email'],
                          style: AppFont.medium.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: listInfomation.length,
                  separatorBuilder: (BuildContext context, int index)  => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    var title = listInfomation.keys.elementAt(index);
                    var subtitle = listInfomation.values.elementAt(index);
                    return InkWell(
                    /*  onTap: () {
                        switch(index){
                          case 0:
                             Navigator.pushNamed(context, MyOrderScreens());
                            break;
                          case 1:
                            Navigator.pushNamed(context, ChoiceAddressScreens);
                            break;
                          case 4:
                            Navigator.pushNamed(context, RecentViewScreens,arguments: productVM.listRecent);
                            break;
                        }
                      }*/
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text(
                          title,
                          style: AppFont.semiBold.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        subtitle: Text(
                          subtitle,
                          style: AppFont.regular.copyWith(
                              fontWeight: FontWeight.w100,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                        /*trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),*/
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        
      ),
    );
  }
}
