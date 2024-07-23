
import '../../../../../config.dart';


class HomeBannerList extends StatelessWidget {
  const HomeBannerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Container(
        margin: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(16),
            bottom: AppScreenUtil().screenHeight(12)),
        height: 200.w,
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.05,
                  viewportFraction: 0.92,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    homeCtrl.current = index;
                    homeCtrl.update();
                  }),
              itemCount: homeCtrl.bannerList.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) {
                return homeCtrl.bannerList.isNotEmpty
                    ? HomeBannerData(
                        data: homeCtrl.bannerList[index],
                        onTap: () {
                          homeCtrl
                              .bannerTap(homeCtrl.bannerList[index].productId);
                          /*appCtrl.isSearch = false;
                          appCtrl.isNotification = true;
                          appCtrl.selectedIndex = 1;
                          appCtrl.update();
                          Get.forceAppUpdate();
                          Get.toNamed(routeName.productDetail,arguments: "All");*/
                        },
                      )
                    : Container();
              },
            ),
            const Space(0, 10),
            const HomeDotIndicator()
          ],
        ),
      );
    });
  }
}
