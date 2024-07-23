import 'package:get_storage/get_storage.dart';
import 'package:multikart/config.dart';
import 'package:multikart/views/pages/currency.dart';
import 'package:launch_review/launch_review.dart';

class DrawerPageController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final storage = GetStorage();
  final pageCtrl = Get.isRegistered<PageListController>()
      ? Get.find<PageListController>()
      : Get.put(PageListController());

//language bottom sheet
  bottomSheet(isLanguage) {
    Get.bottomSheet(
      BottomSheetLayout(
          child: isLanguage ? LanguageBottomSheet() : CurrencyBottomSheet()),
      backgroundColor: appCtrl.appTheme.whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
    );
  }

//go to page index wise
  goToPage(index) async {
    if (index == 2) {
      Get.back();
      pageCtrl.pageListModel = pagesList;
      pageCtrl.update();
      Get.forceAppUpdate();
      Get.toNamed(routeName.pageList);
    } else if (index == 3) {
      Get.back();
    } else if (index == 4) {
      Get.back();
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = true;
      appCtrl.isHeart = true;
      dashboardController.bottomNavigationChange(1, Get.context);

      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
      update();
    } else if (index == 5) {
      Get.back();
      Get.toNamed(routeName.orderHistory);
    } else if (index == 6) {
      Get.back();
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = true;
      appCtrl.isHeart = false;
      dashboardController.bottomNavigationChange(3, Get.context);

      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
      update();
    } else if (index == 7) {
      Get.back();
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = false;
      appCtrl.isHeart = false;
      dashboardController.bottomNavigationChange(4, Get.context);

      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
      update();
    } else if (index == 8) {
      Get.back();
      bottomSheet(true);
      appCtrl.update();
      update();
    } else if (index == 9) {
      Get.back();
      bottomSheet(false);
      appCtrl.update();
      update();
    } else if (index == 10) {
      Get.back();
      Get.toNamed(routeName.notification);
    } else if (index == 11) {
      Get.back();
      LaunchReview.launch(
          androidAppId: environment['firebaseDynamicLinkConfig']
              ['androidPackageName'],
          iOSAppId: "");
      // Get.toNamed(routeName.setting);
    } else if (index == 12) {
      Get.back();
      Get.toNamed(routeName.aboutUs);
    } else if (index == 13) {
      Get.back();
      Get.toNamed(routeName.help);
    }
    update();
  }
}
