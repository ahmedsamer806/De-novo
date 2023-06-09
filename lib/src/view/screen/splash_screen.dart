import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/view/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorRed,
      body:SafeArea(
        
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset("assets/image/screen1.jpeg"),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Text("DE NOVO",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),),
                  ],
                ),
                SizedBox(height: 10,),
                Text("Dress to Impress..!",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),

                SizedBox(height: 20,),

                Container(
                  width: 190,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Row(
                      children: [
                        Text("Get Started",style: TextStyle(
                          color: Colors.black,
                          fontSize: 23
                        ),),
                        SizedBox(width: 15,),
                        Icon(Icons.arrow_forward,color: Colors.black,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,)
              ],
            )
          ),
      )
    );
  }
}
