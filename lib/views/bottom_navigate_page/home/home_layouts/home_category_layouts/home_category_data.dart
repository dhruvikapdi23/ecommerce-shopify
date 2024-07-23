import 'dart:developer';

import '../../../../../config.dart';
import 'package:multikart/models/category_shopify_model.dart' as category_model;

class HomeCategoryData extends StatelessWidget {
  final category_model.Category? data;
  final int? index;

  const HomeCategoryData({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return InkWell(
          onTap: () async {
            homeCtrl.appCtrl.isShare = true;
            homeCtrl.appCtrl.selectedIndex = 1;
            Get.toNamed(routeName.shopPage,arguments: data!);
          },
          child: Padding(
              padding: EdgeInsets.only(
                  right: AppScreenUtil().screenWidth(12),
                  left: AppScreenUtil().screenWidth(index == 0 ? 10 : 0)),
              child: Column(children: [
                SizedBox(
                    height: AppScreenUtil().screenHeight(70),
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Container(
                        width: AppScreenUtil().screenWidth(55),
                        decoration: BoxDecoration(
                          color: homeCtrl.appCtrl.appTheme.homeCategoryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width > 400
                            ? MediaQuery.of(context).size.height / 100
                            : MediaQuery.of(context).size.width < 380
                                ? 5
                                : 0,
                        child: FadeInImageLayout(
                            image: data!.image.toString(),
                            height: AppScreenUtil().screenHeight(60),
                            width: AppScreenUtil().screenWidth(60),
                            fit: BoxFit.contain),
                      )
                    ])),
                LatoFontStyle(
                    text: data!.name,
                    fontWeight: FontWeight.w600,
                    fontSize: FontSizes.f12)
              ])));
    });
  }
}
