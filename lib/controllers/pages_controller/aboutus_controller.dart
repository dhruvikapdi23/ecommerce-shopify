

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../config.dart';

class AboutUsController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  String? url;

  @override
  void onReady() {
    // TODO: implement onReady
    getData();
    update();
    super.onReady();
  }

  //get url from firebase
  getData() async {
    await FirebaseFirestore.instance
        .collection("static")
        .get()
        .then((value) {
      url = value.docs[0].data()["aboutUs"];
      update();
    });
    update();
  }
}
