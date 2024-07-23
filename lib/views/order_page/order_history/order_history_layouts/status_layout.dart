import '../../../../config.dart';

class StatusLayout extends StatelessWidget {
  final String? title;
  const StatusLayout({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = appCtrl.appTheme.greyLight25;
    var textcolor = appCtrl.appTheme.greyLight25;

    if (title == "Pending" || title == "Processing" || title == "Voided") {
      color = appCtrl.appTheme.ratingColor;
      textcolor = appCtrl.appTheme.blackColor;
    } else if (title == "Cancelled" ||
        title == "Refunded" ||
        title == "Expired") {
      color = appCtrl.appTheme.error;
      textcolor = appCtrl.appTheme.white;
    } else if (title == "Completed" ||
        title == "Shipped" ||
        title == "Processed") {
      color = appCtrl.appTheme.green;
      textcolor = appCtrl.appTheme.white;
    } else {
      color = appCtrl.appTheme.primaryLight;
      textcolor = appCtrl.appTheme.blackColor;
    }
    return GetBuilder<AppController>(builder: (appCtrl) {
      return CustomButton(
          padding: 0,
          margin: 0,
          height: AppScreenUtil().screenHeight(20),
          width: AppScreenUtil().screenWidth(60),
          title: title!.toUpperCase(),
          color: color,
          fontSize: FontSizes.f8,
          fontColor: textcolor,
          fontWeight: FontWeight.w700);
    });
  }
}
