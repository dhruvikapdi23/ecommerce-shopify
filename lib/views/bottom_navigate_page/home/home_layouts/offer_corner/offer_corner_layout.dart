import '../../../../../config.dart';

class OfferCornerLayout extends StatelessWidget {
  const OfferCornerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: AppArray().offerCornerList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              homeCtrl.appCtrl.isSearch = false;
              homeCtrl.appCtrl.selectedIndex = 1;
              homeCtrl.appCtrl.update();
              Get.toNamed(routeName.shopPage, arguments: "All");
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(3)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  homeCtrl.appCtrl.isTheme
                      ? Image.asset(imageAssets.offerCornerBG,
                          color: homeCtrl.appCtrl.appTheme.whiteColor)
                      : Image.asset(imageAssets.offerCornerBG),
                  LatoFontStyle(
                    text: AppArray()
                        .offerCornerList[index]['title']
                        .toString()
                        .tr,
                    color: homeCtrl.appCtrl.appTheme.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 0,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / (6)),
        ),
      );
    });
  }
}
