import '../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class ProductPrice extends StatelessWidget {
  final product_model.Product? product;
  const ProductPrice({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return product != null
          ? PriceLayout(
                  totalPrice:
                      '${appCtrl.priceSymbol} ${(double.parse(product!.regularPrice ?? "0.0")).toStringAsFixed(2)}',
                  mrp:
                      '${appCtrl.priceSymbol} ${(product!.salePrice ?? 0 * appCtrl.rateValue)}',
                  discount:
                      "${((double.parse(product!.regularPrice!) - double.parse(product!.price!)) / double.parse(product!.regularPrice!) * 100).toStringAsFixed(0)}%",
                  fontSize: FontSizes.f16,
                  isBold: false,
                  isDiscountShow: true)
              .marginOnly(
                  left: AppScreenUtil().screenWidth(10),
                  right: AppScreenUtil().screenWidth(10))
          : Container();
    });
  }
}
