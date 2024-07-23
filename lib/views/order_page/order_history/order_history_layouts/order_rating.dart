import '../../../../config.dart';

class OrderRating extends StatelessWidget {
  final GestureTapCallback? onTap;
  const OrderRating({Key? key,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                Icons.star_border,
                color: appCtrl.appTheme.contentColor,
                size: AppScreenUtil().size(16),
              ),
              LatoFontStyle(
                  text: OrderHistoryFont().rateReview,
                  fontWeight: FontWeight.w600,
                  fontSize: FontSizes.f12,
                  color: appCtrl.appTheme.contentColor
              ),
              const Space(30, 0),
              Icon(
                Icons.help_outline,
                color: appCtrl.appTheme.contentColor,
                size: AppScreenUtil().size(16),
              ),
              const Space(10, 0),
              LatoFontStyle(
                  text: OrderHistoryFont().needHelp,
                  fontWeight: FontWeight.w600,
                  fontSize: FontSizes.f12,
                  color: appCtrl.appTheme.contentColor
              )
            ],
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
        );
      }
    );
  }
}
