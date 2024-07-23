import '../../../../config.dart';

class RatingLayout extends StatelessWidget {
  const RatingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Row(
        children: [
          Rating(
            val: 2,
            onRatingUpdate: (val) {},
          ),
          const Space(5, 0),
          LatoFontStyle(
            text: "(2 ${ProductDetailFont().ratings})".toString(),
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: productCtrl.appCtrl.appTheme.contentColor,
          )
        ],
      ).marginSymmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(5));
    });
  }
}
