import '../../../../config.dart';

class PageListLayout extends StatelessWidget {
  final PageListModel? pageListModel;

  const PageListLayout({Key? key, this.pageListModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageListController>(builder: (pagesCtrl) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(12)),
            margin: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(15)),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: appCtrl.appTheme.greyLight25,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LatoFontStyle(
                    text: pageListModel!.title!.tr,
                    fontSize: FontSizes.f15,
                    fontWeight: FontWeight.w700,
                    color: appCtrl.appTheme.blackColor),
                const Space(0, 5),
                LatoFontStyle(
                    text: pageListModel!.desc!.tr,
                    fontSize: FontSizes.f12,
                    fontWeight: FontWeight.w500,
                    color: appCtrl.appTheme.contentColor),
              ],
            ),
          ),
          ...pageListModel!.pageList!.map((page) {
            return PageListCard(
                pageList: page,
                onTap: () {
                  if (page.routeName == "/otp") {
                    sendOtp();
                  } else if (page.routeName == "/dashboard") {
                    DashboardController dashboardCtrl = Get.find();
                    if (page.pageName == "categories".tr ||
                        page.pageName == "فئات".tr ||
                        page.pageName == "श्रेणियाँ".tr ||
                        page.pageName == "श्रेणियाँ" "카테고리".tr) {
                      appCtrl.selectedIndex == 1;
                      appCtrl.update();
                    } else if (page.pageName == "cart".tr ||
                        page.pageName == "कार्ट".tr ||
                        page.pageName == "장바구니".tr ||
                        page.pageName == "عربة التسوق".tr) {
                      appCtrl.selectedIndex == 2;
                      appCtrl.update();
                    } else if (page.pageName == "wishlist".tr ||
                        page.pageName == "قائمة الرغبات".tr ||
                        page.pageName == "इच्छा सूची".tr ||
                        page.pageName == "위시리스트".tr) {
                      appCtrl.selectedIndex == 3;
                      appCtrl.update();
                    } else if (page.pageName == "profile".tr ||
                        page.pageName == "प्रोफाइल".tr ||
                        page.pageName == "프로필".tr ||
                        page.pageName == "الملف الشخصي".tr) {
                      appCtrl.selectedIndex == 4;
                      appCtrl.update();
                    }
                    dashboardCtrl.update();
                    Get.forceAppUpdate();
                    Get.toNamed(page.routeName.toString());
                  } else {
                    Get.toNamed(page.routeName.toString(),
                        arguments: page.routeName == "/onBoarding" ||
                                page.routeName == '/login'
                            ? true
                            : "");
                  }
                });
          }).toList(),
          const Space(0, 10),
        ],
      );
    });
  }
}
