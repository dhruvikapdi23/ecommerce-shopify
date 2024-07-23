import 'dart:developer';

import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/new_drop_style_list_card.dart';

import '../../../../../config.dart';

class NewDropCorner extends StatelessWidget {
  int? index;

  NewDropCorner({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient2Controller>(builder: (homeCtrl) {
      return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LatoFontStyle(
                text: HomeFont().newDrops,
                fontSize: FontSizes.f14,
                fontWeight: FontWeight.w700,
                color: homeCtrl.appCtrl.appTheme.blackColor,
              ),
              const Space(0, 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      homeCtrl.homeKidsCornerList.asMap().entries.map((e) {
                    return index == 0 && e.key > 4 && e.key >= 7
                        ? NewDropStyleListCard(
                            data: homeCtrl.homeKidsCornerList[e.key],
                            index: e.key,
                            isFit: true,
                            isDiscountShow: false,
                          ).paddingOnly(right: AppScreenUtil().screenWidth(10))
                        : index == 1 && e.key > 0 && e.key >= 3
                            ? NewDropStyleListCard(
                                data: homeCtrl.homeKidsCornerList[e.key],
                                index: e.key,
                                isFit: true,
                                isDiscountShow: false,
                              ).paddingOnly(
                                right: AppScreenUtil().screenWidth(10))
                            : Container();
                  }).toList(),
                ),
              )
            ],
          ));
    });
  }
}
