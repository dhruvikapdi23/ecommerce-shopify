import '../../config.dart';

class SearchController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final shopCtrl = Get.isRegistered<ShopController>()
      ? Get.find<ShopController>()
      : Get.put(ShopController());

  TextEditingController controller = TextEditingController();
  int selectRecommended = 0;
  List recentSearchList = [];
  List recommendedList = [];
  List innerCategoryProduct = [];

  @override
  void onReady() {
    // TODO: implement onReady
    recentSearchList = AppArray().recentSearchList;
    recommendedList = AppArray().recommendedList;
    innerCategoryProduct = AppArray().innerCategoryProduct;
    update();
    super.onReady();
  }

  //go to shop page
  goToShopPage(name) {
    appCtrl.isNotification = true;
    appCtrl.update();
    Get.toNamed(routeName.shopPage, arguments: name);
  }
}
