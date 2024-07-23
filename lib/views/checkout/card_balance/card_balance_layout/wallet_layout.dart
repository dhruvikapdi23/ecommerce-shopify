import 'package:multikart/config.dart';

class WalletLayout extends StatelessWidget {
  const WalletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        LatoFontStyle(
            text: CommonTextFont().wallets,
            color: appCtrl.appTheme.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: FontSizes.f16),
        const Space(0, 20),
        ...AppArray().walletList.map((e) {
          return Container(
              padding: EdgeInsets.symmetric(
                  vertical: AppScreenUtil().screenHeight(20),
                  horizontal: AppScreenUtil().screenWidth(20)),
              margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(20)),
              decoration: BoxDecoration(
                  color: appCtrl.appTheme.greyLight25,
                  borderRadius:
                      BorderRadius.circular(AppScreenUtil().borderRadius(5))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Image.asset(e['image'].toString(),
                          height: AppScreenUtil().screenHeight(30),
                          width: AppScreenUtil().screenWidth(50),
                          alignment: Alignment.centerLeft),
                      const Space(20, 0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LatoFontStyle(
                                text: e['title'].toString(),
                                fontSize: FontSizes.f14,
                                fontWeight: FontWeight.w600,
                                color: appCtrl.appTheme.blackColor),
                            const Space(0, 5),
                            Row(children: [
                              LatoFontStyle(
                                  text: CardBalanceFont().balance,
                                  fontSize: FontSizes.f12,
                                  fontWeight: FontWeight.w600,
                                  color: appCtrl.appTheme.contentColor),
                              LatoFontStyle(
                                  text:
                                      "${appCtrl.priceSymbol}${(double.parse(e['balance'].toString()) * appCtrl.rateValue)}",
                                  fontSize: FontSizes.f14,
                                  fontWeight: FontWeight.w700,
                                  color: appCtrl.appTheme.blackColor)
                            ])
                          ])
                    ]),
                    LatoFontStyle(
                        text: e['isLink'] == true ? "delink".tr : "link".tr,
                        color: appCtrl.appTheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: FontSizes.f12)
                  ]));
        }).toList()
      ]).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
