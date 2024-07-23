import 'dart:developer';

import 'package:multikart/config.dart';

class ResetPasswordController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController txtCurrent = TextEditingController();
  TextEditingController txtNewPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final FocusNode currentFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmFocus = FocusNode();
  bool passwordVisible = true;
  bool confirmPasswordVisible = true;

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }
  // Toggle Between Confirm Password show
  confirmToggle() {
    confirmPasswordVisible = !confirmPasswordVisible;
    update();
  }

  //sign in
  signIn() async {
    if (signupFormKey.currentState!.validate()) {
      log('Validation');
    } else {
      log('No Valid');
    }
  }

}
