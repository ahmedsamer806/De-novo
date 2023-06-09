
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:fashion_app/src/view/screen/details/widgets/controller.dart';
import 'package:fashion_app/src/view/screen/details/widgets/expanded_child.dart';
import 'package:fashion_app/src/view/screen/details/widgets/preview_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatefulWidget {
  Object? product;
  String imagepass;
  String name;
  var price;

  DetailScreen({
    this.product,
    required this.name,
    this.price,
    required this.imagepass}
      );

  @override
  State<DetailScreen> createState() => _DetailScreenState(product,name,price,imagepass);
}

class _DetailScreenState extends State<DetailScreen> {

  _DetailScreenState(Object? product, String name, price, String imagepass);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: DraggableBottomSheet(
        previewWidget:  SingleChildScrollView(child:  PreviewChild(widget.name,widget.price,widget.imagepass)),
        expandedWidget: SingleChildScrollView(child: ExpandedChild(widget.name,widget.price,widget.imagepass)),
        backgroundWidget: SizedBox(
          child: Image.asset(widget.imagepass),
        ),
        minExtent: 300,
        maxExtent: 560,
        onDragging: (double ) {
      },
      ),
    );
  }
}
