import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import '../../../../../config.dart';

class HomeVarient2CategoryList extends StatelessWidget {
  const HomeVarient2CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<HomeVarient2Controller>(builder: (homeCtrl) {
        return SizedBox(
          height: AppScreenUtil().size(140),
          child: ListView.builder(
            itemCount: homeCtrl.homeCategoryList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppScreenUtil().borderRadius(6)),
                  color: appCtrl.appTheme.greyLight25,
                ),
                child: Stack(children: [
                  Container(
                      alignment: Alignment.topRight,
                      width: AppScreenUtil().screenWidth(150),
                      margin: EdgeInsets.only(
                          right: AppScreenUtil().screenWidth(12),
                          top: AppScreenUtil().screenWidth(4)),
                      padding: const EdgeInsets.all(5),
                      child: Text(homeCtrl.homeCategoryList[index].name!)
                          .fontWeight(FontWeight.w700)
                          .textColor(appCtrl.appTheme.blackColor)
                          .fontSize(FontSizes.f14)),
                  FadeInImage(
                    placeholder: AssetImage(
                      gifAssets.loading,
                    ),
                    image:
                        NetworkImage(homeCtrl.homeCategoryList[index].image!),
                    fit: BoxFit.contain,
                    height: AppScreenUtil().screenHeight(160),
                    width: AppScreenUtil().screenWidth(100),
                    alignment: Alignment.center,
                    placeholderFit: BoxFit.contain,
                  ).paddingAll(AppScreenUtil().screenWidth(10)),
                ]),
              )
                  .marginOnly(
                      top: AppScreenUtil().screenWidth(8),
                      bottom: AppScreenUtil().screenWidth(4))
                  .marginSymmetric(horizontal: AppScreenUtil().screenWidth(5));
            },
          ),
        ).marginOnly(left: AppScreenUtil().screenWidth(12));
        ;
      });
    });
  }
}
