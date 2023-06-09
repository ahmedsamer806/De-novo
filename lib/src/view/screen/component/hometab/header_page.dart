import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  List<String> listImage =  [
    'assets/image/logo_500x500px.png',
    'assets/image/hm.jpg',
    'assets/image/lc.png',
    'assets/image/logo.png'
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
