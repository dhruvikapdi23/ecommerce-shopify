import '../../config.dart';

class SettingController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());


  var settingData = <ProfileModel>[
    ProfileModel(icon: svgAssets.setting,title: 'Mode'.tr,subTitle: ''),
    ProfileModel(icon: svgAssets.setting,title: 'RTL'.tr,subTitle: ''),
    ProfileModel(icon: svgAssets.notification,title: 'Notification'.tr,subTitle: 'Offers, Order tracking messages..'.tr),
  ];

}
