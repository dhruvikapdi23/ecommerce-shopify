import '../../../../config.dart';

class NotificationList extends StatelessWidget {
  final NotificationModel? notificationModel;
  final int? index;
  const NotificationList({Key? key,this.notificationModel,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (notificationCtrl) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color:notificationModel!.isRead!
                      ? notificationCtrl.appCtrl.appTheme.whiteColor
                      : notificationCtrl.appCtrl.appTheme.greyLight25,
                  border: Border(
                    bottom: BorderSide(
                      color:notificationModel!.isRead!
                          ? notificationCtrl
                          .filterList[index! - 1].isRead ==
                          false
                          ? notificationCtrl
                          .appCtrl.appTheme.whiteColor
                          : notificationCtrl
                          .appCtrl.appTheme.whiteColor
                          : notificationCtrl
                          .appCtrl.appTheme.borderColor,
                    ),
                  )),
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15),
                  vertical: AppScreenUtil().screenHeight(15)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        AppScreenUtil().borderRadius(5)),
                    child: FadeInImageLayout(
                      image:notificationModel!.image,
                      height: AppScreenUtil().screenHeight(65),
                      width: AppScreenUtil().screenWidth(75),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Space(15, 0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LatoFontStyle(
                          text:notificationModel!.title,
                          color:
                          notificationCtrl.appCtrl.appTheme.blackColor,
                          fontSize: FontSizes.f13,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.clip,
                        ),
                        const Space(0, 5),
                        LatoFontStyle(
                          text:notificationModel!.date,
                          color:
                          notificationCtrl.appCtrl.appTheme.contentColor,
                          fontSize: FontSizes.f12,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
