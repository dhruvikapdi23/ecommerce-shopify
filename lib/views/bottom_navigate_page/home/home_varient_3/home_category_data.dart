import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';

import '../../../../../config.dart';
import 'package:multikart/models/category_shopify_model.dart' as category_model;

class HomeV3CategoryData extends StatelessWidget {
  final category_model.Category? data;
  final int? index;

  const HomeV3CategoryData({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient3Controller>(builder: (homeCtrl) {
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: homeCtrl.appCtrl.appTheme.homeCategoryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20)),
        child: InkWell(
            onTap: () async {
              homeCtrl.appCtrl.isHeart = true;
              homeCtrl.appCtrl.isCart = true;
              homeCtrl.appCtrl.isShare = false;
              homeCtrl.appCtrl.isSearch = false;
              homeCtrl.appCtrl.isNotification = false;
              homeCtrl.appCtrl.selectedIndex = 1;
              homeCtrl.appCtrl.update();
              homeCtrl.appCtrl.isShimmer = true;
              homeCtrl.update();
              await Future.delayed(DurationClass.s1);
              homeCtrl.appCtrl.isShimmer = false;
              homeCtrl.appCtrl.update();
              Get.forceAppUpdate();
            },
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              FadeInImageLayout(
                  image: data!.image.toString(),
                  height: AppScreenUtil().screenHeight(40),
                  width: AppScreenUtil().screenWidth(40),
                  fit: BoxFit.fill),
              LatoFontStyle(
                  text: data!.name,
                  fontWeight: FontWeight.w600,
                  fontSize: FontSizes.f13)
            ])),
      );
    });
  }
}
