import '../../../../config.dart';

class ProductLikeDislike extends StatelessWidget {
  final Reviews? reviews;
  const ProductLikeDislike({Key? key,this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          children: [
            SvgPicture.asset(svgAssets.thumbsUp,height: AppScreenUtil().screenHeight(15)),
            const Space(5, 0),
            LatoFontStyle(text: reviews!.like.toString(),fontSize: FontSizes.f12,color: appCtrl.appTheme.contentColor,).marginOnly(right: AppScreenUtil().screenWidth(15)),

            SvgPicture.asset(svgAssets.thumbsDown,height: AppScreenUtil().screenHeight(15)),
            const Space(5, 0),
            LatoFontStyle(text: reviews!.disLike.toString(),fontSize: FontSizes.f12,color: appCtrl.appTheme.contentColor,),
          ],
        );
      }
    );
  }
}
