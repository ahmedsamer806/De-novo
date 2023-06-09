import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../../model/shop.dart';

class ProductTile extends StatelessWidget {
  final Shop product;
  const ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    print(product.name);
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset(
                    "assets/image/"+product.id.toString()+".png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: product.isLike ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_border),
                      onPressed: () {
                        product.isLike=!product.isLike;
                      },
                    ),
                  )),
                )
              ],),
            SizedBox(height: 8),
            Text(
              product.gender,
              maxLines: 2,
              style:
              TextStyle( fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (product.id != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.id.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text('\$${product.price}',
                style: TextStyle(fontSize: 32, )),
          ],
        ),
      ),
    );
  }
}
