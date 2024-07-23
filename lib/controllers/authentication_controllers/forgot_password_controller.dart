import 'package:multikart/config.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/user.dart';
import 'dart:developer';

class ForgotPasswordController extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController txtEmail = TextEditingController();

  User? user;

  //sentOtp
  sendOtp() async {
    final val = await shopifyService
        .submitForgotPassword(forgotPwLink: '', data: {'email': txtEmail.text});
   log("val : $val");
  }
}
