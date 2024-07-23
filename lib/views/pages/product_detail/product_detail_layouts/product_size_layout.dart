import 'package:multikart/config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class ProductSizeLayout extends StatelessWidget {
  final product_model.Product? product;

  const ProductSizeLayout({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return product != null ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        for (var attr in product!.attributes!)
          attr.name == 'Size'
              ? Container(
                  child: ProductDetailWidget().commonText(
                      text: ProductDetailFont().selectSize, fontSize: 14))
              : Container(),
        SingleChildScrollView(
          child: Row(
            children: [
              for (var attr in product!.attributes!)
                ...attr.options!.asMap().entries.map((e) {
                  return attr.name == 'Size'
                      ? SizeCard(
                          sizeModel: e.value,
                          index: e.key,
                          selectSize: productCtrl.selectedSize,
                          onTap: () {
                            productCtrl.selectedSize = e.key;
                            productCtrl.update();
                          })
                      : Container();
                }).toList()
            ],
          ),
        ).marginOnly(
            left: AppScreenUtil().screenWidth(15),
            top: AppScreenUtil().screenHeight(10))
      ]):Container();
    });
  }
}
