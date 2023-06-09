import 'package:fashion_app/controller/authHelper.dart';
import 'package:fashion_app/remoteService/handles%20database.dart';
import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/view/screen/login_screen.dart';
import 'package:fashion_app/src/view/screen/more_info.dart';
import 'package:flutter/material.dart';
import 'component/addaddress/text_field_address.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  var isShowPass=true;

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
                  "Sign up",
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
                    textEditingController: nameController, lableText: "Name"),
                SizedBox(
                  height: 40,
                ),
                TextFieldAddress(
                    textEditingController: emailController,
                    lableText: "Email"),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.2),
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(1, 1),
                        ),
                      ]),
                  child: TextFormField(
                    controller: passController,
                    obscureText: isShowPass,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              isShowPass =! isShowPass;
                            });
                          },
                          child: Icon(
                            isShowPass ? Icons.visibility : Icons.visibility_off,
                            size: 16,
                          )),
                      alignLabelWithHint: true,
                      // center labastyle
                      labelStyle: AppFont.regular.copyWith(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      "Already have an account?",
                      style: AppFont.medium.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ),
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
                      RemoteServices.readShopsData();
                      AuthenticationHelper()
                          .signUp(email: emailController.text.trim(), password: passController.text.trim())
                          .then((result) async{
                        if (result == null) {
                      //    await AuthenticationHelper.getuser();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => MoreInformationScreen(this.nameController.text)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              result,
                              style: TextStyle(fontSize: 16),
                            ),
                          ));
                        }
                      });
                    },
                    child: Text(
                      "sign up".toUpperCase(),
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
}
