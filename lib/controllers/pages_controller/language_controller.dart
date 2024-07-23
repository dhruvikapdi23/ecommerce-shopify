import 'package:get_storage/get_storage.dart';

import '../../config.dart';

class LanguageController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final pageCtrl = Get.isRegistered<PageListController>()
      ? Get.find<PageListController>()
      : Get.put(PageListController());
  final storage = GetStorage();
  final productCtrl = Get.isRegistered<ProductDetailController>()
      ? Get.find<ProductDetailController>()
      : Get.put(ProductDetailController());
  final categoryCtrl = Get.isRegistered<CategoryController>()
      ? Get.find<CategoryController>()
      : Get.put(CategoryController());
  final saveAddressCtrl = Get.isRegistered<SaveAddressController>()
      ? Get.find<SaveAddressController>()
      : Get.put(SaveAddressController());

  //language selection
  languageSelection(e) async {
    if (e['name'] == "English" ||
        e['name'] == 'अंग्रेजी' ||
        e['name'] == 'انجليزي' ||
        e['name'] == '영어') {
      var locale = const Locale("en", 'US');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
      appCtrl.languageVal = "en";
      storage.write(Session.languageCode, "en");
      storage.write(Session.countryCode, "US");
    } else if (e['name'] == "Arabic" ||
        e['name'] == 'अरबी' ||
        e['name'] == 'عربي' ||
        e['name'] == '아랍어') {
      var locale = const Locale("ar", 'AE');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
      appCtrl.languageVal = "ar";
      storage.write(Session.languageCode, "ar");
      storage.write(Session.countryCode, "AE");
    } else if (e['name'] == "Korean" ||
        e['name'] == 'कोरियाई' ||
        e['name'] == 'كوري' ||
        e['name'] == '한국어') {
      var locale = const Locale("ko", 'KR');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
      appCtrl.languageVal = "ko";
      storage.write(Session.languageCode, "ko");
      storage.write(Session.countryCode, "KR");
    } else if (e['name'] == "Hindi" ||
        e['name'] == 'हिंदी' ||
        e['name'] == 'هندي' ||
        e['name'] == '힌디어') {
      appCtrl.languageVal = "hi";
      var locale = const Locale("hi", 'IN');
      Get.updateLocale(locale);
      Get.forceAppUpdate();
      storage.write(Session.languageCode, "hi");
      storage.write(Session.countryCode, "IN");
    }
    appCtrl.update();

    DashboardController dashboardController = Get.find();
    HomeController homeController = Get.find();
    dashboardController.drawerList = AppArray().drawerList;
    pageCtrl.pageListModel = pagesList;
    // productCtrl.product = productList;
    appCtrl.bottomList = AppArray().bottomSheet;
    homeController.getData();
    homeController.offerCornerList = AppArray().offerCornerList;
    // categoryCtrl.categoryList = AppArray().categoryList;
    saveAddressCtrl.deliveryDetail = deliveryDetailArray;
    homeController.update();
    Get.forceAppUpdate();
    pageCtrl.update();
    categoryCtrl.update();
    saveAddressCtrl.update();
    productCtrl.update();
    Get.forceAppUpdate();
    dashboardController.update();
    appCtrl.update();
    update();
    Get.forceAppUpdate();
    // Get.back();
  }
}
