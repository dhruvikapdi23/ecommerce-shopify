import '../../../../config.dart';

class ReviewCard extends StatelessWidget {
  final Reviews? reviews;
  final int? index, lastIndex;

  const ReviewCard({Key? key, this.reviews,this.index,this.lastIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                reviews!.image.toString(),
                height: AppScreenUtil().screenHeight(45),
              ),
              ReviewNameDate(
                reviews: reviews,
              )
            ],
          ).marginSymmetric(vertical: AppScreenUtil().screenHeight(15)),
          LatoFontStyle(
            text: reviews!.description.toString().tr,
            fontWeight: FontWeight.normal,
            fontSize: FontSizes.f14,
            color: appCtrl.appTheme.contentColor,
            overflow: TextOverflow.clip,
          ),
          ProductSize(reviews: reviews),
          if(index != lastIndex)
          Divider(
            color: appCtrl.appTheme.greyLight25,
          )
        ],
      );
    });
  }
}
