import '../../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class FindStyleListCard extends StatelessWidget {
  final product_model.Product? data;
  final int? index;
  final bool isDiscountShow, isFit;
  final GestureTapCallback? onTap;
  const FindStyleListCard(
      {Key? key,
      this.data,
      this.index,
      this.isDiscountShow = true,
      this.isFit = true,this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return InkWell(
          onTap: onTap,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(alignment: Alignment.topLeft, children: [
              Stack(alignment: Alignment.topRight, children: [
                ProductImage(image: data!.images[0].toString(), isFit: isFit),
                LinkHeartIcon(
                  isLiked: data!.isFav,
                  onTap: (val) => homeCtrl.addToWishList(index, val, data),
                ).paddingOnly(
                    top: AppScreenUtil().screenHeight(10),
                    right: AppScreenUtil().screenWidth(15))
              ]),
              // if (data!.isNew) const NewLayout()
            ]),
            const Space(0, 5),
            // Rating(
            //   val: double.parse(data!.rating.toString()),
            //   onRatingUpdate: (val) {},
            // ),
            LatoFontStyle(
              text: data!.name!.tr,
              fontSize: FontSizes.f14,
              fontWeight: FontWeight.normal,
              color: appCtrl.appTheme.blackColor,
            ).paddingOnly(left: AppScreenUtil().screenWidth(5)),
            const Space(0, 5),
            PriceLayout(
                totalPrice:
                    '${appCtrl.priceSymbol} ${(double.parse(data!.regularPrice!) * appCtrl.rateValue).toStringAsFixed(2)}',
                mrp:
                    '${appCtrl.priceSymbol} ${(double.parse(data!.salePrice!) * appCtrl.rateValue)}',
                discount:
                    "${((double.parse(data!.regularPrice!) - double.parse(data!.price!)) / double.parse(data!.regularPrice!) * 100).toStringAsFixed(0)}%",
                fontSize: isDiscountShow
                    ? MediaQuery.of(context).size.width > 400
                        ? FontSizes.f11
                        : FontSizes.f12
                    : FontSizes.f12,
                isDiscountShow: isDiscountShow)
          ]),
        );
      });
    });
  }
}