import '../../../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

class WishListCard extends StatelessWidget {
  final product_model.Product? homeDealOfTheDayModel;
  final int? index, lastIndex;
  final GestureTapCallback? firstActionTap;
  final GestureTapCallback? secondActionTap;

  const WishListCard(
      {Key? key,
      this.homeDealOfTheDayModel,
      this.lastIndex,
      this.index,
      this.firstActionTap,
      this.secondActionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppScreenUtil().borderRadius(3)),
                  child: FadeInImageLayout(
                    image: homeDealOfTheDayModel!.images[0],
                    fit: BoxFit.contain,
                    height: AppScreenUtil().size(110),
                    width: AppScreenUtil().size(110),
                  ),
                ),
                const Space(10, 0),
                DealsOfTheDayContent(
                  data: homeDealOfTheDayModel,
                  isVariantsShow: false,
                  isActionShow: true,
                  firstActionTap: firstActionTap,
                  secondActionTap: secondActionTap,
                ),
              ],
            ).marginSymmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(15)),
            if (index != lastIndex) const BorderLineLayout()
          ],
        ),
      );
    });
  }
}
