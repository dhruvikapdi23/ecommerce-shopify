import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../config.dart';

class SocialLoginController extends GetxController {
  bool isLoading = false;
  final storage = GetStorage();

  //show loader
  void showLoading() {
    isLoading = true;
    update();
  }

  //hide loader
  void hideLoading() {
    isLoading = false;
    update();
  }


  //google Login function
  googleLogin() async {
    showLoading();
    update();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      (await auth.signInWithCredential(credential)).user;
      hideLoading();
      update();
      saveData(googleSignInAccount.id);
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      hideLoading();
      update();
      showToast(e.toString());
      rethrow;
    } finally {
      hideLoading();
      update();
    }
  }

  //save data in shared pref
  saveData(userid) async {
    await storage.write('id', userid);
    update();
    Get.toNamed(routeName.dashboard);
  }

  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }
}

class Resource {
  final Status status;
  Resource({required this.status});
}

enum Status { success, error, cancelled }
