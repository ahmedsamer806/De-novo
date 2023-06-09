import 'package:fashion_app/src/const/app_colors.dart';
import 'package:fashion_app/src/view/screen/component/favoritetab/favorite_scroll.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorRed,
        title: Text(
          " Wishing List ",
              style: TextStyle(
            fontSize: 20
        ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: FavoriteScroll(),
        ),
      ),
    );
  }

}
