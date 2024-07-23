import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:multikart/controllers/home_product_controllers/drawer_controller.dart';
import 'package:multikart/routes/screen_list.dart';
import 'package:multikart/utilities/storage_utils.dart';

import '../../config.dart';

class DashboardController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  AnimationController? drawerSlideController;

  final drawerCtrl = Get.isRegistered<DrawerPageController>()
      ? Get.find<DrawerPageController>()
      : Get.put(DrawerPageController());

  List drawerList = [];
  final storage = GetStorage();

  @override
  void onReady() async {
    appCtrl.isShimmer = true;
    appCtrl.update();
    drawerList = AppArray().drawerList;
    update();
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
    super.onReady();
  }

  //bottom change
  bottomNavigationChange(val, context) async {
    if (val == 4) {
      if (getStorage(Session.userInfo) == null) {
        appCtrl.selectedIndex = 0;
        await storage.write(Session.selectedIndex, 0);
        appCtrl.isLoading = true;
        appCtrl.isShimmer = true;
        appCtrl.update();
        Get.offAll(() => const LoginScreen());
      } else {
        log("getStorage(Session.userInfo) : ${getStorage(Session.userInfo)}");
        log("val : $val");
        appCtrl.isHeart = false;
        appCtrl.isCart = false;
        appCtrl.isShare = false;
        appCtrl.isSearch = false;
        appCtrl.isNotification = false;
        appCtrl.update();
        appCtrl.selectedIndex = val;
        await storage.write(Session.selectedIndex, val);
      }
    } else {
      log("getStorage(Session.userInfo) : ${getStorage(Session.userInfo)}");
      log("val : $val");
      appCtrl.isHeart = false;
      appCtrl.isCart = false;
      appCtrl.isShare = false;
      appCtrl.isSearch = false;
      appCtrl.isNotification = false;
      appCtrl.update();
      appCtrl.selectedIndex = val;
      await storage.write(Session.selectedIndex, val);
    }

    appCtrl.rightValue = MediaQuery.of(context).size.width;
    if (appCtrl.selectedIndex == 0) {
      appCtrl.isHeart = true;
      appCtrl.isCart = true;
      appCtrl.isShare = false;
      appCtrl.isSearch = true;
      appCtrl.isNotification = true;
    } else if (appCtrl.selectedIndex == 1) {
      appCtrl.isHeart = true;
      appCtrl.isCart = true;
      appCtrl.isShare = false;
      appCtrl.isSearch = false;
      appCtrl.isNotification = false;
    } else if (appCtrl.selectedIndex == 2) {
      appCtrl.isHeart = true;
      appCtrl.isCart = false;
      appCtrl.isShare = false;
      appCtrl.isSearch = false;
      appCtrl.isNotification = false;
    } else if (appCtrl.selectedIndex == 3) {
      appCtrl.isHeart = false;
      appCtrl.isCart = true;
      appCtrl.isShare = false;
      appCtrl.isSearch = false;
      appCtrl.isNotification = false;
    } else if (appCtrl.selectedIndex == 4) {
      appCtrl.isHeart = false;
      appCtrl.isCart = false;
      appCtrl.isShare = false;
      appCtrl.isSearch = false;
      appCtrl.isNotification = false;
    }
    appCtrl.isLoading = false;

    update();
    if (appCtrl.selectedIndex != 4) {
      await Future.delayed(DurationClass.s1);
    }
    appCtrl.isShimmer = false;
    appCtrl.update();
    update();
    Get.forceAppUpdate();
  }

  //app bar leading action
  appBarLeadingAction() async {
    appCtrl.goToHome();
    await storage.write(Session.selectedIndex, 0);
    appCtrl.selectedIndex = 0;
    update();
  }
}
