import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import '../../../../../config.dart';

class HomeBannerVarient2List extends StatelessWidget {
  const HomeBannerVarient2List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient2Controller>(builder: (homeCtrl) {
      return Container(
        margin: EdgeInsets.only(
          top: AppScreenUtil().screenHeight(10),
        ),
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.05,
                  viewportFraction: 1,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    homeCtrl.current = index;
                    homeCtrl.update();
                  }),
              itemCount: homeCtrl.bannerList.length,
              itemBuilder:
                  (BuildContext context, int index, int pageViewIndex) {
                return homeCtrl.bannerList.isNotEmpty
                    ? InkWell(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppScreenUtil().screenWidth(18)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppScreenUtil().borderRadius(10))),
                          child: HomeWidget().bannerImage(
                              homeCtrl.bannerList[index].image, context),
                        ),
                      )
                    : Container();
              },
            ),
          ],
        ),
      );
    });
  }
}
