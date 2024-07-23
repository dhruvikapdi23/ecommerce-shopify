import '../../../../config.dart';

class ReviewNameDate extends StatelessWidget {
  final Reviews? reviews;
  const ReviewNameDate({Key? key,this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LatoFontStyle(
                  text: reviews!.name.toString().tr,
                  fontWeight: FontWeight.normal,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.blackColor,
                ),
                LatoFontStyle(
                  text: "|",
                  fontWeight: FontWeight.normal,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.blackColor,
                ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(10)),
                LatoFontStyle(
                  text: reviews!.date.toString().tr,
                  fontWeight: FontWeight.normal,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.blackColor,
                ),
              ],
            ),
            Rating(
              val: reviews!.rating,
              onRatingUpdate: (val) {},
            )
          ],
        ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
      }
    );
  }
}
