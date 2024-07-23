import '../../../../config.dart';

class CartBottomLayout extends StatelessWidget {
  final String? totalAmount, buttonName, desc;
  final bool isPrimaryDesc;
  final GestureTapCallback? onTap;

  const CartBottomLayout(
      {Key? key,
      this.totalAmount,
      this.buttonName,
      this.desc,
      this.isPrimaryDesc = true,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              vertical: AppScreenUtil().screenHeight(
                  MediaQuery.of(context).size.width > 400 ? 10 : 5),
              horizontal: AppScreenUtil().screenWidth(15)),
          decoration: BoxDecoration(
            color: appCtrl.appTheme.whiteColor,
            boxShadow: [
              BoxShadow(
                color: appCtrl.appTheme.lightGray,
                spreadRadius: 10,
                blurRadius: 5,
                offset: const Offset(0, 7), // changes position of shadow
              ),
            ],
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                height: AppScreenUtil().screenHeight(
                    MediaQuery.of(context).size.width > 400 ? 60 : 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LatoFontStyle(
                              text: "${appCtrl.priceSymbol} $totalAmount",
                              fontSize: FontSizes.f16,
                              textAlign: TextAlign.center)
                          .gestures(onTap: () => Get.back()),
                      LatoFontStyle(
                          text: desc,
                          fontSize: FontSizes.f12,
                          textAlign: TextAlign.start,
                          color: isPrimaryDesc
                              ? appCtrl.appTheme.primary
                              : appCtrl.appTheme.contentColor),
                    ])),
            CustomButton(
                title: buttonName!,
                height: AppScreenUtil().screenHeight(
                    MediaQuery.of(context).size.width > 400 ? 50 : 30),
                width: AppScreenUtil().screenWidth(200),
                fontSize: FontSizes.f14,
                onTap: onTap,
                margin: 0)
          ]));
    });
  }
}
