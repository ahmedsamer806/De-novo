import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:fashion_app/src/view/screen/dashbord.dart';

import 'package:fashion_app/src/view/screen/forgot_pass_screen.dart';
import 'package:fashion_app/src/view/screen/home_tab.dart';
import 'package:fashion_app/src/view/screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../controller/authHelper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
   bool isShowPass = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/login.jpeg"),
                  fit: BoxFit.cover
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  "Login",
                  style: AppFont.bold.copyWith(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // TextFieldAddress(vi
                //     textEditingController: emailController, lableText: "Email"),
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
                    controller: emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Email",
                      alignLabelWithHint: true, // center labastyle
                      labelStyle: AppFont.regular.copyWith(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

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
                  height: 35,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPassScreen()));
                  },
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forget your password?",
                      style: AppFont.medium.copyWith(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.primaryColorRed,
                      value: true,
                      onChanged: ( value) {
                      },
                    ),
                    Text("Remember me?",style: AppFont.medium.copyWith(
                      fontSize: 14,
                    ),),
                  ],
                ),
                SizedBox(
                  height: 25,
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
                      AuthenticationHelper()
                          .signIn(email: emailController.text.trim(), password:passController.text.trim())
                          .then((result)async {
                        if (result == null) {
                          await AuthenticationHelper.getuser();
                          print(AuthenticationHelper.app_user);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => MyHomePage()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              result==null?"":result,
                              style: TextStyle(fontSize: 16),
                            ),
                          ));
                        }
                      });

                    },
                    child: Text(
                      "Login".toUpperCase(),
                      style: AppFont.medium
                          .copyWith(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()),
                            (Route<dynamic> route) => false
                    );
                  },
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: AppFont.medium.copyWith(fontSize: 15),
                        children: [
                          TextSpan(
                            text: "Register",
                            style: AppFont.bold.copyWith(
                                fontSize: 15, color: AppColors.primaryColorRed),
                          )
                        ]),
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
