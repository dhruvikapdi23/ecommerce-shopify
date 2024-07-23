import '../../../../config.dart';

class NotificationCategory extends StatelessWidget {
  const NotificationCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<NotificationController>(
      builder: (notificationCtrl) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...notificationCtrl.notificationCategoryList
                  .asMap()
                  .entries
                  .map((e) {
                return FindYourStyleCategoryCard(
                  index: e.key,
                  data: e.value,
                  isHomePage: true,
                  selectedStyleCategory: notificationCtrl.categoryId,
                  onTap: () => notificationCtrl.categoryWiseList(
                      e.value['id'], e.key),
                ).height(AppScreenUtil().screenHeight(50));
              }).toList()
            ],
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
        );
      }
    );
  }
}
