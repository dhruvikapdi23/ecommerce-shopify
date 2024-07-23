import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/models/category_shopify_model.dart' as category_model;

import '../../config.dart';

class CategoryController extends GetxController with ShopifyMixin{
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List<category_model.Category> categoryList = [];

  @override
  void onReady() {
    // TODO: implement onReady
    getData();
    super.onReady();
  }

  //get data list
  getData()async{
    appCtrl.isShimmer = true;
    appCtrl.update();
    categoryList =await shopifyService.getCategoriesByCursor();;

    update();
    await Future.delayed(DurationClass.s1);
    appCtrl.isShimmer = false;
    appCtrl.update();
    update();
  }
}
