import 'package:multikart/config.dart';

class InnerCategoryController extends GetxController{
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  CategoryModel? categoryModel;
  int index=0;
  bool expand = false;
  int? tapped = 0;
  List innerCategoryList = [];
  List innerCategoryProduct = [];
  List innerCategoryBrandList = [];


  @override
  void onReady() {
    // TODO: implement onReady
    var data = Get.arguments;
    categoryModel = data['data'];
    innerCategoryList = AppArray().innerCategoryList;
    innerCategoryProduct = AppArray().innerCategoryProduct;
    innerCategoryBrandList = AppArray().innerCategoryBrandList;
    index = data['index'];
    update();
    super.onReady();
  }

  //expanded
  expandBox(index) {
    expand =
    ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;

    tapped = index;
    update();
  }

  //go to shop page
  goToShopPage(name){
    appCtrl.isNotification = true;
    appCtrl.update();
    Get.toNamed(routeName.shopPage,arguments: name);
  }
}
