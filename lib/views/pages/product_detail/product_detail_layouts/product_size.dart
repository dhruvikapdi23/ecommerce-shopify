import '../../../../config.dart';

class ProductSize extends StatelessWidget {
  final Reviews? reviews;

  const ProductSize({Key? key, this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: AppScreenUtil().screenWidth(160),
            alignment: Alignment.center,
            height: AppScreenUtil().screenHeight(35),
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(10)),
            margin: EdgeInsets.only(
                top: AppScreenUtil().screenHeight(15),
                bottom: AppScreenUtil().screenHeight(10)),
            decoration: BoxDecoration(
              color: appCtrl.appTheme.lightGray,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LatoFontStyle(
                  text: ProductDetailFont().sizeBought,
                  color: appCtrl.appTheme.blackColor,
                  fontSize: FontSizes.f13,
                  fontWeight: FontWeight.w600,
                ),
                LatoFontStyle(
                  text: " ${reviews!.size}",
                  color: appCtrl.appTheme.contentColor,
                  fontSize: FontSizes.f13,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          ProductLikeDislike(
            reviews: reviews,
          )
        ],
      );
    });
  }
}
