import '../../../../config.dart';

class TimeLineContent extends StatelessWidget {
  final dynamic data;

  const TimeLineContent({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Padding(
          padding:  EdgeInsets.only(left: 8.0,right: appCtrl.isRTL ||
              appCtrl.languageVal == "ar" ? 8.0 :0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Insets.i10, vertical: Insets.i5),
                  decoration: BoxDecoration(
                      color: appCtrl.appTheme.greyLight25,
                      borderRadius: BorderRadius.circular(50)),
                  child: LatoFontStyle(
                      text: data['title'].toString().tr,
                      fontSize: FontSizes.f14,
                      fontWeight: FontWeight.w700,
                      color: (data['isCompete'] == true)
                          ? appCtrl.appTheme.blackColor
                          : appCtrl.appTheme.contentColor)),
              LatoFontStyle(
                text: data['date'].toString(),
                fontSize: FontSizes.f14,
              ).paddingOnly(top: Insets.i10, bottom: Insets.i15),
            ],
          ));
    });
  }
}
