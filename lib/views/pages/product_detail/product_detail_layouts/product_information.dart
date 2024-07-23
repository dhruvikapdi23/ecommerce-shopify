import 'package:multikart/views/pages/product_detail/product_detail_layouts/image_list_layout_v2.dart';
import 'package:multikart/views/pages/product_detail/product_detail_layouts/image_list_layout_v3.dart';

import '../../../../config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return StreamBuilder(
          stream: FirebaseFirestore.instance.collection("config").snapshots(),
          builder: (context, snapShot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image list
                snapShot.data!.docs[0].data()["ProductDetailsVariant"] == 1
                    ? const ImageListLayout()
                    : snapShot.data!.docs[0].data()["ProductDetailsVariant"] ==
                            2
                        ? const ImageListV2Layout()
                        : const ImageListV3Layout(),
                ProductDetailWidget().commonText(
                    text: productCtrl.product!.name.toString().tr,
                    fontSize: FontSizes.f16),
                ProductDetailWidget().descriptionText(
                    productCtrl.product!.description.toString().tr),
                //rating layout
                // const RatingLayout(),

                //price layout
                ProductPrice(product: productCtrl.product),

                //inclusive of all taxes layout
                ProductDetailWidget()
                    .inclusiveTax(ProductDetailFont().inclusiveOfAllTaxes),
                const BorderLineLayout(),

                //product size layout
                ProductSizeLayout(product: productCtrl.product),

                //color list layout
                ProductColorLayout(product: productCtrl.product),
                ProductDetailWidget().commonText(
                    text: ProductDetailFont().quantity,
                    fontSize: FontSizes.f14),

                //quantity increase - decrease layout
                const QuantityIncDec(),
                const BorderLineLayout(),
              ],
            );
          });
    });
  }
}
