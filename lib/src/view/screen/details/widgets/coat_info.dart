import 'package:flutter/material.dart';
import '../themes/colors.dart';

class CoatInfoWidget extends StatelessWidget {
  String name;
  var price;
  CoatInfoWidget(this.name,this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                this.name.toString().length>30?this.name.toString().substring(0,20):this.name.toString(),
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
               SizedBox(
                height: 8,
              ),
              Text(
                ''+this.price.toString(),
                style: TextStyle(
                  color: Colorz.greyColor500,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Your Size',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 30,
                    height: 27,
                    child: Card(
                      color: index == 1 ? Colorz.pinkColor : Colorz.ghostWhite,
                      elevation: 5,
                      child: Center(
                        child: Text(
                          _sizes[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            child: Column(
              children: List.generate(
                1,
                (index) => index == 0
                    ? Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        height: 0.5,
                        width: 0.5,
                        decoration: BoxDecoration(
                            color: Colorz.greyColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.symmetric(vertical: 7),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            color: Colorz.itemColorz[index],
                            borderRadius: BorderRadius.circular(10)),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  final List<String> _sizes = ['S', 'M', 'L', 'XL'];
}
