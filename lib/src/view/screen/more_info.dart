import 'package:fashion_app/controller/handleFirestore.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/view/screen/dashbord.dart';
import 'package:fashion_app/src/view/screen/home_tab.dart';
import 'package:flutter/material.dart';
import 'component/addaddress/text_field_address.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MoreInformationScreen extends StatefulWidget {

  String name;

  MoreInformationScreen(this.name);

  @override
  State<MoreInformationScreen> createState() => _MoreInformationScreenState();
}

class _MoreInformationScreenState extends State<MoreInformationScreen> {
  FirestoreHelper firestoreHelper= FirestoreHelper();

  final highthController = TextEditingController();

   final gender = TextEditingController();

  final wigthController = TextEditingController();

  bool ismale=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/login.jpeg"),
                  fit: BoxFit.cover
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                      size: 20,
                    )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "More Information",
                  style: AppFont.bold.copyWith(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFieldAddress(
                    textEditingController: wigthController, lableText: "Weight"),
                SizedBox(
                  height: 40,
                ),
                TextFieldAddress(
                    textEditingController: highthController,
                    lableText: "height "),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.primaryColorRed,
                      value: ismale,
                      onChanged: (value) {
                        setState(() {
                          ismale=value!;
                          value==true?gender.text="MALE":gender.text="FEMALE";
                        });

                      },
                    ),
                    Text("If you are male check the box ",style: AppFont.medium.copyWith(
                      fontSize: 15,
                    ),),
                  ],
                ),
              /*  TextFieldAddress(

                    textEditingController: gender,
                    lableText: "gender"),

               */
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primaryColorRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                    onPressed: () async{
                      if(highthController.text.isNotEmpty&&wigthController.text.isNotEmpty&&
                      gender.text.isNotEmpty){
                      firestoreHelper.addUser(
                        name:this.widget.name.toString(),
                        email: FirebaseAuth.instance.currentUser?.email.toString(),
                        gender: gender.text.toString().toUpperCase()=='FEMALE'||gender.text.toString().toUpperCase()=='WOMAN'?"female":"male",
                        weight: get_weight(wigthController.text),
                        heigth: highthController.text.toString(),
                        currentuserid: FirebaseAuth.instance.currentUser?.uid.toString()
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Your information Saving.........",
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                      await Future.delayed(const Duration(seconds: 1), (){});
                      Route route = MaterialPageRoute(builder: (context) => MyHomePage());
                      Navigator.pushReplacement(context, route);
                      }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Your must complete your information.........",
                              style: TextStyle(fontSize: 16),
                            ),
                          ));
                          await Future.delayed(const Duration(seconds: 1), (){});
                        }

                      },
                    child: Text(
                      "let's start".toUpperCase(),
                      style: AppFont.medium
                          .copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String get_weight(String W){
    if(int.parse(W)>90)
      return "over";
    else if (int.parse(W)>70)
      return "mediam";
    else
      return "under";
  }
}
