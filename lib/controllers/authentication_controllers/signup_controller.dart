import 'dart:developer';

import 'package:multikart/config.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/user.dart';

class SignUpController extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final socialLoginCtrl = Get.isRegistered<SocialLoginController>()
      ? Get.find<SocialLoginController>()
      : Get.put(SocialLoginController());

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();
  bool passwordVisible = true;
  List<User> userList = [];

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  //sign in
  signIn() async {
    log("WELCOME");
    if (signupFormKey.currentState!.validate()) {
      checkLogin();
      FocusScope.of(Get.context!).requestFocus(FocusNode());
    } else {
      log('No Valid');
    }
  }

  void checkLogin() async {
    try {
      User data = await shopifyService.createUser(
        firstName: txtName.text,
        email: txtEmail.text,
        password: txtPassword.text,
      );
      userList.add(data);
      txtName.clear();
      txtName.clear();
      txtEmail.clear();
      txtPassword.clear();
      update();
      Get.back();
    } catch (e) {
      log("ERRRRRROOOOOO : ${e.toString()}");
      log(e.toString().substring(11));
      Get.snackbar(
        "Alert",
        e.toString().substring(11),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: appCtrl.appTheme.primary,
        borderRadius: 0,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }
}
