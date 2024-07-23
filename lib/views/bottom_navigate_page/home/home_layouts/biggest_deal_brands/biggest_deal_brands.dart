import '../../../../../config.dart';

class DealsBrands extends StatelessWidget {
  const DealsBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
                  text: HomeFont().biggestDeal,
                  fontSize: FontSizes.f16,
                  fontWeight: FontWeight.normal,
                  color: homeCtrl.appCtrl.appTheme.blackColor)
              .marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    AppArray().biggestDealBrandList.asMap().entries.map((e) {
                  return InkWell(
                    onTap: () {
                      homeCtrl.appCtrl.isSearch = false;
                      homeCtrl.appCtrl.selectedIndex = 1;
                      homeCtrl.appCtrl.update();
                      Get.toNamed(routeName.shopPage, arguments: "All");
                    },
                    child: Container(
                        width: AppScreenUtil().screenWidth(120),
                        alignment: Alignment.center,
                        height: AppScreenUtil().screenHeight(35),
                        padding: EdgeInsets.symmetric(
                            vertical: AppScreenUtil().screenHeight(10)),
                        margin: EdgeInsets.only(
                            left: AppScreenUtil()
                                .screenWidth(e.key == 0 ? 15 : 0),
                            right: AppScreenUtil().screenWidth(15),
                            top: AppScreenUtil().screenHeight(15),
                            bottom: AppScreenUtil().screenHeight(10)),
                        decoration: BoxDecoration(
                          color: homeCtrl.appCtrl.appTheme.greyLight25,
                          borderRadius: BorderRadius.circular(AppScreenUtil()
                              .borderRadius(AppScreenUtil().borderRadius(5))),
                        ),
                        child: Image.asset(e.value['image'].toString(),
                            fit: BoxFit.contain,
                            color: homeCtrl.appCtrl.isTheme
                                ? homeCtrl.appCtrl.appTheme.contentColor
                                : homeCtrl.appCtrl.appTheme.blackColor,
                            width: AppScreenUtil().screenHeight(150),
                            height: AppScreenUtil().screenHeight(50))),
                  );
                }).toList(),
              ))
        ],
      ).marginOnly(
          top: AppScreenUtil().screenHeight(20),
          bottom: AppScreenUtil().screenHeight(20));
    });
  }
}
