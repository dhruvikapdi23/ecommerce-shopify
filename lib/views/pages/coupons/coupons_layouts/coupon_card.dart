import '../../../../config.dart';

class CouponCard extends StatelessWidget {
  final CouponModel? couponModel;
  final int? index, lastIndex;
final GestureTapCallback? onTap;
  const CouponCard({Key? key, this.couponModel, this.index, this.lastIndex,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              LatoFontStyle(
                  text: couponModel!.code,
                  fontSize: FontSizes.f14,
                  color: appCtrl.appTheme.blackColor,
                  fontWeight: FontWeight.w600),
              CouponTitle(
                title: couponModel!.title,
              ),
            ],
          ),
          LatoFontStyle(
              text: CouponFont().apply,
              color: appCtrl.appTheme.primary,
              fontSize: FontSizes.f14,
              fontWeight: FontWeight.w600).inkWell(onTap:onTap)
        ]),
        const Space(0, 12),
        LatoFontStyle(
            text: couponModel!.description,
            overflow: TextOverflow.clip,
            color: appCtrl.appTheme.contentColor,
            fontSize: FontSizes.f12),
        const Space(0, 10),
        LatoFontStyle(
            text: CouponFont().viewTAndC,
            color: appCtrl.appTheme.greenColor,
            fontSize: FontSizes.f12,
            fontWeight: FontWeight.w600),
        const Space(0, 15),
        if (index != lastIndex)
          Divider(
            color: appCtrl.appTheme.greyLight25,
          )
      ])
          .marginOnly(bottom: AppScreenUtil().screenHeight(10))
          .marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
