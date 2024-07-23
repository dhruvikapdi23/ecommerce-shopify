
import '../../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class DealsOfTheDayCard extends StatelessWidget {
  final int? index;
  final product_model.Product? data;

  const DealsOfTheDayCard({Key? key, this.index, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
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
