import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:multikart/config.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/user.dart';
import 'package:multikart/utilities/storage_utils.dart';

class LoginController extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final socialLoginCtrl = Get.isRegistered<SocialLoginController>()
      ? Get.find<SocialLoginController>()
      : Get.put(SocialLoginController());

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isBack = false;
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  bool passwordVisible = true;
  User? user;

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  //firebase login with email and password
  login() async {
    log("txtEmail.text: ${txtEmail.text}");
    log("txtPassword.text: ${txtPassword.text}");
    FocusManager.instance.primaryFocus?.unfocus();
    socialLoginCtrl.showLoading();
    user = await shopifyService.login(
      username: txtEmail.text,
      password: txtPassword.text,
    );
    if (user != null) {
      final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      firebaseMessaging.getToken().then((token) async {
        log("token : $token");
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.id)
            .set({'id': user!.id, "pushToken": token});
      });
      log("user : $user");
      writeStorage(Session.userInfo, user);
      txtEmail.clear();
      txtPassword.clear();
      update();
      appCtrl.storage.write(Session.isLogin, true);
      Get.toNamed(routeName.dashboard);
      socialLoginCtrl.hideLoading();
    } else {
      Get.snackbar(
        "Alert",
        "Invalid Credentials",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appCtrl.appTheme.primary,
        borderRadius: 0,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
      socialLoginCtrl.hideLoading();
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    isBack = Get.arguments ?? false;
    update();
    super.onReady();
  }
}
