import 'package:multikart/config.dart';


class InnerCategory extends StatefulWidget {
  const InnerCategory({Key? key}) : super(key: key);

  @override
  State<InnerCategory> createState() => _InnerCategoryState();
}

class _InnerCategoryState extends State<InnerCategory> {
  var innerCtrl = Get.put(InnerCategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerCategoryController>(builder: (_) {
      return Directionality(
        textDirection: innerCtrl.appCtrl.isRTL ||
            innerCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: WillPopScope(
          onWillPop: () async {
            innerCtrl.appCtrl.isSearch = false;
            innerCtrl.appCtrl.update();
            Get.back();
            return true;
          },
          child: Scaffold(
              //app bar layout
              appBar: HomeProductAppBar(
                onTap: () {
                  innerCtrl.appCtrl.isSearch = false;
                  innerCtrl.appCtrl.update();
                  Get.back();
                },
                titleChild: CommonAppBarTitle(
                  title: DashboardFont().categories,
                  desc: innerCtrl.categoryModel != null
                      ? innerCtrl.categoryModel!.title.toString().tr
                      : "",
                  isColumn: false,
                ),
              ),
              bottomNavigationBar: GetBuilder<DashboardController>(builder: (dashboardCtrl) {
                return CommonBottomNavigation(
                  onTap: (val) {
                    Get.back();
                    dashboardCtrl.bottomNavigationChange(val, context);
                  },
                );
              }),
              body: innerCtrl.appCtrl.isShimmer ? const InnerCategoryShimmer(): const InnerCategoryBody()),
        ),
      );
    });
  }
}
