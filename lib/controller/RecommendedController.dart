

import 'package:fashion_app/model/shop.dart';
import 'package:fashion_app/remoteService/handles%20database.dart';
import 'package:get/get.dart';

import '../model/recommended.dart';

class RecommendedController extends GetxController {

  var isLoading = true.obs;
  // ignore: deprecated_member_use
  var ShopList = [].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
  void fetchProducts() async {
    try {
      isLoading(true);
      List<Recommended> products = await RemoteServices.readRecommendedData();
      if (products != null) {
        ShopList.value = products;
        print("here");
      }
      print(ShopList.length);
    }

    finally {isLoading(false);}
  }



}