

import 'package:fashion_app/model/mesuares.dart';
import 'package:fashion_app/model/shop.dart';
import 'package:fashion_app/remoteService/handles%20database.dart';
import 'package:get/get.dart';

class MeasureController extends GetxController {

  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var ShopList = <Measure>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.readMeasureData();
      if (products != null) {
        ShopList.value = products;
      }
    }
    finally {isLoading(false);}
  }

}