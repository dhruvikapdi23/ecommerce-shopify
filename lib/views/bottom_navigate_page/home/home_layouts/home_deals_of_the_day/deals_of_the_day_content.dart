import 'package:multikart/views/bottom_navigate_page/wishlist/widget_layouts/wishlist_action.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import '../../../../../config.dart';

class DealsOfTheDayContent extends StatelessWidget {
  final product_model.Product? data;
  final bool isVariantsShow, isActionShow;
  final GestureTapCallback? firstActionTap, secondActionTap;

  const DealsOfTheDayContent(
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
        children: [
          LatoFontStyle(
              text: data!.name!.tr,
              fontWeight: FontWeight.w700,
              color: appCtrl.appTheme.blackColor,
              fontSize: FontSizes.f12),
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
          ]),
          const Space(0, 2),
          LatoFontStyle(
              text: data!.inStock! ? HomeFont().isStock : HomeFont().outStock,
              fontWeight: FontWeight.w700,
              color: data!.inStock!
                  ? appCtrl.appTheme.greenColor
                  : appCtrl.appTheme.error,
              fontSize: FontSizes.f12),
          const Space(0, 10),
          if (isVariantsShow)
            Variants(
                firstActionTap: firstActionTap,
                secondActionTap: secondActionTap),
          if (isActionShow)
            WishListAction(
                firstActionTap: firstActionTap,
                secondActionTap: secondActionTap)
        ],
      );
    });
  }
}
