import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? imageUrl;
  final String? itemName;
  final String? itemPrice;
  const CustomCard({Key? key, this.imageUrl, this.itemName, this.itemPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colorz.primaryColor,
      width: 170,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(right: 10, left: 10),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                height: 170,
                width: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset(
                    "assets/image/"+imageUrl.toString()+".png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemName!.length>12? itemName!.substring(0,11): itemName!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$itemPrice',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
