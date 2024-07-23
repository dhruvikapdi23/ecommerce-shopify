import '../../../../config.dart';

class PolicyLayout extends StatelessWidget {
  final String? text;
  const PolicyLayout({Key? key,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDetailWidget().commonText(
                text: ProductDetailFont().returnExchangePolicy,
                fontSize: FontSizes.f14),
            LatoFontStyle(
              text: text,
              fontWeight: FontWeight.w600,
              fontSize: FontSizes.f14,
              color: appCtrl.appTheme.contentColor,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.start,
            ).marginSymmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(15))
          ],
        );
      }
    );
  }
}
