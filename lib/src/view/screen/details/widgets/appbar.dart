import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class CustomAppbar extends StatelessWidget {
  final Widget? widget;
  const CustomAppbar({Key? key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 25, left: 10),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget!,Icon(Icons.shopping_cart),
        ],
      ),
    );
  }
}
