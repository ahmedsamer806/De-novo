import 'package:fashion_app/model/shop.dart';
import 'package:fashion_app/remoteService/handles%20database.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {

  var isLoading = true.obs;
  // ignore: deprecated_member_use
   var ShopList =<Shop>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.readShopsData();
      if (products != null) {
        ShopList.value = products;
        print(ShopList.value.length);
      }
    }
    finally {isLoading(false);}
  }
}