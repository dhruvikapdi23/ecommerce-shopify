import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graphql/client.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/utilities/storage_utils.dart';
import 'package:multikart/views/pages/currency.dart';

import '../../config.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  var auth = FirebaseAuth.instance;
  final storage = GetStorage();
  CartModel? cartModelList;
  List<ProfileModel> drawerList = [];
  String genderSelectedValue = "Male";

  var gender = ["Male", "Female", "Other"];

  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtDob = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode dobFocus = FocusNode();
  final FocusNode mobileNumberFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  void onReady() {
    // TODO: implement onReady
    drawerList = profileList;
    update();
    super.onReady();
  }

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

  deleteAccount() async {
    await deleteAccountApi();
    try {

      storage.erase();
      Get.offAllNamed(routeName.login);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  deleteAccountApi() async{
    final String  shopifyStoreUrl = '${environment["serverConfig"]["domain"]}/admin/customers/${getStorage(Session.userInfo)['id']}.json';

    http.delete(
        Uri.parse(
            shopifyStoreUrl),
        headers: {
          "X-Shopify-Access-Token": environment["serverConfig"]["adminAccessToken"]
        }).then((http.Response response) {
      // snackBar(DeliveryDetailFont().addressDelete.tr);
      update();

    });
  }

//go to page index wise
  goToPage(index) async {
    print(index);

    appCtrl.isShimmer = true;
    appCtrl.update();
    if (index == 2) {
      Get.toNamed(routeName.pageList);
    } else if (index == 3) {
      Get.toNamed(routeName.orderHistory);
    } else if (index == 4) {
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = true;
      dashboardController.bottomNavigationChange(3, Get.context);

      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
    } else if (index == 5) {
      Get.toNamed(routeName.cardBalance);
    } else if (index == 6) {
      Get.toNamed(routeName.saveAddress);
    } else if (index == 7) {
      bottomSheet(true);
    } else if (index == 8) {
      bottomSheet(false);
    } else if (index == 9) {
      Get.toNamed(routeName.notification);
      // } else if (index == 10) {
      //   Get.toNamed(routeName.setting);
    } else if (index == 10) {
      Get.toNamed(routeName.profileSetting);
      // } else if (index == 12) {
      //   Get.toNamed(routeName.termsCondition);
      // } else if (index == 13) {
      //   Get.toNamed(routeName.help);
    } else if (index == 11) {
      deleteAccount();
    }
    update();
    await Future.delayed(DurationClass.s1);
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
  }
}
