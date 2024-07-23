import '../../../../config.dart';

class CardNameAndExpiry extends StatelessWidget {
  final String? name,expiryDate;
  const CardNameAndExpiry({Key? key,this.expiryDate,this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardBalanceWidget().commonFontText(name),
            Row(
              children: [
                LatoFontStyle(
                  text: CardBalanceFont().valid,
                  fontSize: FontSizes.f5,
                  color: appCtrl.appTheme.white,
                ),
                Icon(
                  Icons.arrow_right,
                  color: appCtrl.appTheme.white,
                  size: AppScreenUtil().size(12),
                ),
                CardBalanceWidget().commonFontText(name,fontSize: FontSizes.f12),
              ],
            ),
          ],
        );
      }
    );
  }
}
