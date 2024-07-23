import 'package:multikart/config.dart';

class Coupons extends StatelessWidget {
  final couponCtrl = Get.put(CouponsController());

  Coupons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponsController>(builder: (_) {
      return Directionality(
        textDirection:
            couponCtrl.appCtrl.isRTL || couponCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: const BackArrowButton(),
              backgroundColor: couponCtrl.appCtrl.appTheme.whiteColor,
              title: LatoFontStyle(
                  text: CouponFont().couponTitle,
                  color: couponCtrl.appCtrl.appTheme.blackColor)),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    //coupon text box layout
                    const CouponTextBox(
                      isSuffixIcon: false,
                    ),
                    const Space(0, 10),

                    //coupon list layout
                    CouponList(
                      couponList: couponCtrl.couponList,
                    )
                  ],
                ),
              )),
              if(couponCtrl.isLoading)
                Center(child: CircularProgressIndicator())
            ],
          ),
        ),
      );
    });
  }
}
