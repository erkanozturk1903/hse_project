import 'package:hse_project/controllers/my_controller.dart';
import 'package:hse_project/models/product.dart';

import 'package:get/get.dart';

class EcommerceProductsController extends MyController {
  List<Product> products = [];

  EcommerceProductsController();

  @override
  void onInit() {
    super.onInit();

    Product.dummyList.then((value) {
      products = value;
      update();
    });
  }

  void goToCreateProduct() {
    Get.toNamed('/apps/ecommerce/add_product');
  }
}
