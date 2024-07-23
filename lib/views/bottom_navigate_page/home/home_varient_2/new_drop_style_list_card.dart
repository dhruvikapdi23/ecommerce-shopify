import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import '../../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class NewDropStyleListCard extends StatelessWidget {
  final product_model.Product? data;
  final int? index;
  final bool isDiscountShow, isFit;

  const NewDropStyleListCard(
      {Key? key,
      this.data,
      this.index,
      this.isDiscountShow = true,
      this.isFit = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient2Controller>(builder: (homeCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return InkWell(
          onTap: () => appCtrl.goToProductDetail(data),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProductImage(image: data!.images[0].toString(), isFit: isFit),
            const Space(0, 5),
            LatoFontStyle(
              text: data!.name!.tr,
              fontSize: FontSizes.f14,
              fontWeight: FontWeight.normal,
              color: appCtrl.appTheme.blackColor,
            ).paddingOnly(left: AppScreenUtil().screenWidth(5)),
            const Space(0, 5),
            LatoFontStyle(
              text:
                  '${appCtrl.priceSymbol} ${(double.parse(data!.price!) * appCtrl.rateValue).toStringAsFixed(2)}',
              fontSize: FontSizes.f12,
              fontWeight: FontWeight.w700,
              color: appCtrl.appTheme.blackColor,
            ).paddingOnly(left: AppScreenUtil().screenWidth(5)),
          ]),
        );
      });
    });
  }
}
