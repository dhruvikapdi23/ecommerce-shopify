import '../../../../config.dart';

class ProductReviewLayout extends StatelessWidget {
  const ProductReviewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LatoFontStyle(
                text:
                    "${ProductDetailFont().customerReviews} (${productCtrl.product!.totalReview})",
                fontWeight: FontWeight.w700,
                fontSize: FontSizes.f14,
                color: productCtrl.appCtrl.appTheme.blackColor,
              ),
              LatoFontStyle(
                text: ProductDetailFont().allReviews,
                fontSize: FontSizes.f12,
                color: productCtrl.appCtrl.appTheme.primary,
              )
            ],
          ),
          if (productCtrl.product!.reviews != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...productCtrl.product!.reviews!.asMap().entries.map((e) {
                  return ReviewCard(
                    reviews: e.value,
                    index: e.key,
                    lastIndex: productCtrl.product!.reviews!.length - 1,
                  );
                }).toList()
              ],
            )
        ],
      ).marginSymmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(20));
    });
  }
}
