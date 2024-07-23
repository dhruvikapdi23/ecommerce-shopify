import '../../../../config.dart';

class WalletCard extends StatelessWidget {
  final dynamic data;

  const WalletCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(20),
              horizontal: AppScreenUtil().screenWidth(20)),
          margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(20)),
          decoration: BoxDecoration(
              color: appCtrl.appTheme.greyLight25,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Image.asset(data['image'].toString(),
                    height: AppScreenUtil().screenHeight(30),
                    width: AppScreenUtil().screenWidth(50),
                    alignment: Alignment.centerLeft),
                const Space(20, 0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  LatoFontStyle(
                      text: data['title'].toString(),
                      fontSize: FontSizes.f14,
                      fontWeight: FontWeight.w600,
                      color: appCtrl.appTheme.blackColor),
                  const Space(0, 5),
                  Row(children: [
                    LatoFontStyle(
                        text: "Balance: ",
                        fontSize: FontSizes.f12,
                        fontWeight: FontWeight.w600,
                        color: appCtrl.appTheme.contentColor),
                    LatoFontStyle(
                        text:"${appCtrl.priceSymbol}${data['balance'].toString()}",
                        fontSize: FontSizes.f14,
                        fontWeight: FontWeight.w700,
                        color: appCtrl.appTheme.blackColor)
                  ])
                ])
              ],
            ),
            CardBalanceWidget().deLinkOrLinkText(data['isLink'])
          ]));
    });
  }
}
