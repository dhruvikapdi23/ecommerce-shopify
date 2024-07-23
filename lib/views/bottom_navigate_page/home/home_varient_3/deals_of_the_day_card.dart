import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';

import '../../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class DealsOfTheDayCardV3 extends StatelessWidget {
  final int? index;
  final product_model.Product? data;

  const DealsOfTheDayCardV3({Key? key, this.index, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient3Controller>(builder: (homeCtrl) {
      return index! < 3
          ? HomeWidget()
              .dealsOfTheDayCardLayout(
                context: context,
                index: index,
                greyLight25: homeCtrl.appCtrl.appTheme.greyLight25,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        HomeWidget().imageLayout(data!.images[0]),
                        const Space(10, 0),
                        DealsOfTheDayContent(
                          data: data,
                        ),
                      ],
                    ),
                    LinkHeartIcon(
                      isLiked: data!.isFav,
                      onTap: (val) => homeCtrl.addToWishList(index, val, data),
                    )
                  ],
                ),
              )
              .gestures(onTap: () => homeCtrl.appCtrl.goToProductDetail(data))
          : Container();
    });
  }
}
