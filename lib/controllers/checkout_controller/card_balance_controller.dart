import '../../config.dart';

class CardBalanceController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int currentIndex = 0;
}
