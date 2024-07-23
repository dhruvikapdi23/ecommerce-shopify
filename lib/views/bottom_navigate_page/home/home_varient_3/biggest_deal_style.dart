import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_3/deals_style_sub_category.dart';

import '../../../../../config.dart';

class BiggestDealStyle extends StatelessWidget {
  const BiggestDealStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient3Controller>(builder: (homeCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LatoFontStyle(
                  text: HomeFont().biggestDealv3,
                  fontSize: FontSizes.f15,
                  fontWeight: FontWeight.w700,
                  color: homeCtrl.appCtrl.appTheme.blackColor,
                ),
                const Space(0, 10),
                const DealStyleSubCategory()
              ],
            )
          ],
        ),
      );
    });
  }
}
