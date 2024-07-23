import '../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class PaymentMethodCard extends StatelessWidget {
  final product_model.Product? data;
  final bool isVariantsShow;
  final bool isActionShow;
  final GestureTapCallback? firstActionTap;
  final GestureTapCallback? secondActionTap;

  const PaymentMethodCard(
      {Key? key,
      this.data,
      this.isVariantsShow = false,
      this.isActionShow = false,
      this.firstActionTap,
      this.secondActionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            LatoFontStyle(
                text: data!.name!.tr,
                fontWeight: FontWeight.w700,
                color: appCtrl.appTheme.blackColor,
                fontSize: FontSizes.f12),
            const Space(0, 2),
            data!.type != null
                ? LatoFontStyle(
                    text: data!.type!.tr,
                    fontWeight: FontWeight.w500,
                    color: appCtrl.appTheme.contentColor,
                    fontSize: FontSizes.f12)
                : Container(),
            const Space(0, 5),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              LatoFontStyle(
                  text:
                      '${appCtrl.priceSymbol} ${(double.parse(data!.price!.toString()) * appCtrl.rateValue)}',
                  fontWeight: FontWeight.w400,
                  color: appCtrl.appTheme.blackColor,
                  fontSize: FontSizes.f13),
              const Space(8, 0),
              LatoFontStyle(
                  text:
                      '${appCtrl.priceSymbol} ${(double.parse(data!.regularPrice!.toString()) * appCtrl.rateValue).toStringAsFixed(2)}',
                  fontWeight: FontWeight.w400,
                  color: appCtrl.appTheme.contentColor,
                  fontSize: FontSizes.f13,
                  textDecoration: TextDecoration.lineThrough),
              const Space(8, 0),
              LatoFontStyle(
                  text:
                      "${((double.parse(data!.regularPrice!) - double.parse(data!.price!)) / double.parse(data!.regularPrice!) * 100).toStringAsFixed(0)}%",
                  fontWeight: FontWeight.w400,
                  color: appCtrl.appTheme.primary,
                  fontSize: FontSizes.f13)
            ])
          ]);
    });
  }
}
