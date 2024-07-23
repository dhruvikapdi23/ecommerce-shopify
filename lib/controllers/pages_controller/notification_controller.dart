import '../../config.dart';

class NotificationController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  int categoryId = 0;
  List notificationCategoryList = [];
  List<NotificationModel> notificationList = [];
  List<NotificationModel> filterList = [];

  @override
  void onReady() {
    // TODO: implement onReady
    notificationCategoryList = AppArray().notificationCategory;
    notificationList = notificationArray;
    filterList = notificationList;
    update();
    super.onReady();
  }

  //category wise list
  categoryWiseList(id,index) {

    filterList =[];
    categoryId = index;
    for (var i = 0; i < notificationList.length; i++) {
      if (id == notificationList[i].categoryId) {
        filterList.add(notificationList[i]);
      }
    }
    update();
  }
}
