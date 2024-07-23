import '../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class SimilarProductLayout extends StatelessWidget {
  final List<product_model.Product>? data;
  final double bottom;

  const SimilarProductLayout({Key? key, this.data, this.bottom = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: data!.asMap().entries.map((e) {
          return e.key < 3
              ? FindStyleListCard(
                  data: data![e.key],
                  isFit: true,
                  isDiscountShow: false,
                  onTap: () => appCtrl.goToProductDetail(data![e.key]),
                ).paddingOnly(right: AppScreenUtil().screenWidth(10))
              : Container();
        }).toList(),
      ),
    ).marginOnly(
        left: AppScreenUtil().screenWidth(15),
        top: AppScreenUtil().screenHeight(10),
        bottom: AppScreenUtil().screenHeight(bottom));
  }
}
