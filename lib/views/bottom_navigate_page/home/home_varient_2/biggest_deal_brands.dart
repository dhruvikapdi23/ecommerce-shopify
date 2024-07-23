import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import '../../../../../config.dart';

class DealsHomeBrands extends StatelessWidget {
  const DealsHomeBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient2Controller>(builder: (homeCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: AppArray().biggestDealBrandList.length,
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
                child: Image.asset(
                    AppArray().biggestDealBrandList[index]['image'].toString(),
                    color: appCtrl.appTheme.darkGray,
                    fit: BoxFit.contain)),
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(20));
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8
          
          ,
          mainAxisSpacing: 5,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / (5)),
        ),
      );
    });
  }
}
