import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeaderPage2 extends StatelessWidget {
  List<String> listImage =  [
 'assets/image/bannar/1.jpeg',
    'assets/image/bannar/2.jpeg',
    'assets/image/bannar/3.jpeg',
    'assets/image/bannar/4.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        viewportFraction: 1.0,
        autoPlay: true,
        enlargeCenterPage: false,
        // autoPlay: false,
      ),
      items: listImage.map((e) => Image.asset(e,fit: BoxFit.cover,)).toList(),
    );
  }
}
