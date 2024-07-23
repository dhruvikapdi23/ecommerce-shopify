
import '../../../../config.dart';

class OtpWidget{
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());


  //common decoration
  OutlineInputBorder decoration() =>OutlineInputBorder(borderSide: BorderSide(color: appCtrl.appTheme.lightGray));
}