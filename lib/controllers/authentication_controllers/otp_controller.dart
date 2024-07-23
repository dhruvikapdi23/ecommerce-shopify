
import 'package:multikart/config.dart';

class OtpController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController txtEmail = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  // 4 text editing controllers that associate with the 4 input fields
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();


  @override
  void onReady() async {
    fieldOne;
    fieldTwo;
    fieldThree;
    fieldFour;
    update();
    super.onReady();
  }

}
