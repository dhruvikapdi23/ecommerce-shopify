
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../config.dart';

class HelpController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  bool expand = false;
  int? tapped = 0;
  List helpList =[];
  String? url;


  @override
  void onReady() {
    // TODO: implement onReady
    helpList = AppArray().helpList;
    update();
    getData();
    super.onReady();
  }

  //get contact url from firebase
  getData() async {
    await FirebaseFirestore.instance
        .collection("static")
        .get()
        .then((value) {
      url = value.docs[0].data()["contactUs"];
      update();
    });
    update();

  }
}
