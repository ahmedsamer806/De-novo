import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/const/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItem extends StatelessWidget {
  String name;
  String price;
  String imagePass;
  CartItem({
    required this.name,
    required this.price,
    required this.imagePass}
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        imagePass,
                        fit: BoxFit.fill,
                        width: 170,
                        height: 200,
                      ),
                    ),
                  )
                  /*Positioned(
                      top: 5,
                      right: 3,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: (){

                          },
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: AppColors.primaryColorRed,
                      )),*/
                  /*Positioned(
                      right: 0,
                      bottom: 0,
                      width: 40,
                      height: 40,
                      child: Container(
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColorRed,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(.2),
                                  offset: Offset(1, 1),
                                  spreadRadius: 3,
                                  blurRadius: 3),
                            ],
                          ),
                          child: SvgPicture.asset(
                            'assets/image/bag_active.svg',
                            fit: BoxFit.scaleDown,
                            color: Colors.white,
                          ))),*/
                ],
              ),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 5,
                    direction: Axis.horizontal,
                    itemSize: 15,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('(10)')
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: AppFont.regular.copyWith(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                price,
                style: AppFont.bold.copyWith(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 8,
              ),

            ],
          )),
    );
  }
}
