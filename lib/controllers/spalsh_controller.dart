import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multikart/config.dart';

class SplashController extends GetxController {
  bool isTapped = false;
  final storage = GetStorage();
  @override
  void onInit() async {
    await Future.delayed(DurationClass.s3);
    isTapped = true;
    update();
    await Future.delayed(DurationClass.s1);
    checkLogin();
    super.onInit();
  }

  void checkLogin() async {
    //#region set Language
    String? languageCode = storage.read(Session.languageCode);
    String? countryCode = storage.read(Session.countryCode);
    bool? isLogin = storage.read(Session.isLogin);
    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }
    //#endregion

    bool isIntro = storage.read(Session.isIntro) ?? false;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    log(isIntro.toString());
    if (isIntro.toString() == "false") {
      Get.toNamed(routeName.onBoarding);
    } else {
      log(user.toString());
      if (isLogin == false) {
        // Checking if user is already login or not
        Get.toNamed(routeName.dashboard);
      } else {
        Get.toNamed(routeName.dashboard);
      }
    }
  }
}
