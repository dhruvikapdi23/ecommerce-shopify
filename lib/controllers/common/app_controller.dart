import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:multikart/views/bottom_navigate_page/cart/cart.dart';
import 'package:multikart/views/bottom_navigate_page/category/category.dart';
import 'package:multikart/views/bottom_navigate_page/home/home.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient2.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient3.dart';
import 'package:multikart/views/bottom_navigate_page/profile/profile.dart';
import 'package:multikart/views/bottom_navigate_page/wishlist/wishlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../config.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  bool isLoading = false;
  int selectedIndex = 0;
  bool isTheme = false;
  bool isRTL = false;
  bool isNotificationShow = false;
  String languageVal = "en";
  List bottomList = [];
  bool isSearch = true;
  bool isNotification = true;
  bool isCart = true;
  bool isHeart = true;
  bool isShare = false;
  bool isShimmer = true;
  double rightValue = 15;
  final storage = GetStorage();
  AppTheme get appTheme => _appTheme;
  double rateValue = 0.0;
  String priceSymbol = "₹";
  String homeVariant = "1";

//list of bottommost page
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const ProfileScreen()
  ];

  @override
  void onReady() async {
    bottomList = AppArray().bottomSheet;
    rateValue = double.parse(AppArray().currencyList[0]['INR'].toString());
    getData();
    selectHomepageVariant();
    super.onReady();
  }

  selectHomepageVariant() async {
    await FirebaseFirestore.instance.collection("config").get().then((value) {
      value.docs[0].data()["homeVariant"].toString() == "1"
          ? widgetOptions[0] = const HomeScreen()
          : value.docs[0].data()["homeVariant"].toString() == "2"
              ? widgetOptions[0] = const HomeVarient2Screen()
              : widgetOptions[0] = const HomeVarient3Screen();
    });
  }

  //go to product detail screen
  goToProductDetail(data, {isHomePage = false}) {
    final productCtrl = Get.isRegistered<ProductDetailController>()
        ? Get.find<ProductDetailController>()
        : Get.put(ProductDetailController());
    if (isHomePage) {
      Get.toNamed(routeName.productDetail, arguments: data);
    } else {
      Get.offAllNamed(routeName.productDetail, arguments: data);
    }
    isNotification = false;
    isSearch = false;
    isCart = true;
    isShare = true;
    isHeart = true;
    update();
    Get.forceAppUpdate();
    productCtrl.onInit();
    productCtrl.update();
  }

  //go to shop page
  goToShopPage(name) {
    isNotification = true;
    update();
    Get.toNamed(routeName.shopPage, arguments: name);
  }

  //go to home screen
  goToHome() {
    isHeart = true;
    isCart = true;
    isShare = false;
    isSearch = true;
    isNotification = true;
    appCtrl.selectedIndex = 0;
    update();
  }

//get data from storage
  getData() async {
    String? languageCode = storage.read(Session.languageCode);
    languageVal = storage.read(Session.languageCode) ?? 'en';
    String? countryCode = storage.read(Session.countryCode);

    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }
    update();

    //theme check
    bool loadThemeFromStorage = storage.read('isDarkMode') ?? false;
    if (loadThemeFromStorage) {
      isTheme = true;
    } else {
      isTheme = false;
    }

    update();
    await storage.write("isDarkMode", isTheme);
    ThemeService().switchTheme(isTheme);
    Get.forceAppUpdate();

    await storage.read('isDarkMode');
  }

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }
}
