import '../../config.dart';

class SaveAddressController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  String value = "address";
  int selectRadio = 0;
  DeliveryDetailModel? deliveryDetail;

  //select address
  selectAddress(val,index){
    value = val.name!;
    selectRadio = index;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    deliveryDetail = deliveryDetailArray;
    update();
    super.onReady();
  }
}
