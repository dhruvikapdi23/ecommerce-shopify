import '../../../../config.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //product information
            const ProductInformation(),
            //similar product text layout
            ProductDetailWidget().commonText(
                text: ProductDetailFont().similarProducts,
                fontSize: FontSizes.f14),

            //similar product layout
            SimilarProductLayout(data: productCtrl.similarList),
          ],
        ),
      );
    });
  }
}
