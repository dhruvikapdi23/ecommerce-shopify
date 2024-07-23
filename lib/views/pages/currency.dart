import 'package:multikart/controllers/pages_controller/currency_controller.dart';

import '../../../config.dart';

class CurrencyBottomSheet extends StatelessWidget {
  final currencyCtrl = Get.put(CurrencyController());

  CurrencyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CurrencyController>(builder: (_) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Directionality(
          textDirection: currencyCtrl.appCtrl.isRTL
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: BottomSheetLayout(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //select language text layout
              LatoFontStyle(
                text: CommonTextFont().selectCurrency,
                fontSize: FontSizes.f16,
                color: currencyCtrl.appCtrl.appTheme.blackColor,
              ),
              const Space(0, 20),

              //language list
              ...AppArray().currencyList.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(10)),
                  child: InkWell(
                    onTap: () => currencyCtrl.currencyChange(e, e['code']),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          e['icon'].toString(),
                          height: AppScreenUtil().screenHeight(25),
                          fit: BoxFit.contain,
                          color: appCtrl.appTheme.blackColor,
                        ),
                        const Space(10, 0),
                        LatoFontStyle(
                            text: e['title'].toString(),
                            fontSize: FontSizes.f16,
                            color: currencyCtrl.appCtrl.appTheme.blackColor)
                      ],
                    ),
                  ),
                );
              }).toList()
            ],
          )),
        );
      });
    });
  }
}
