import '../../../../config.dart';

class InnerCategoryBody extends StatelessWidget {
  const InnerCategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerCategoryController>(
      builder: (innerCtrl) {
        return SingleChildScrollView(
          child: Column(children: [
            //category info. layout
            if (innerCtrl.categoryModel != null)
              // CategoryCardLayout(
              //   categoryModel: innerCtrl.categoryModel,
              //   index: innerCtrl.index,
              //   isEven: true,
              //   onTap: () async{
              //     innerCtrl.appCtrl.isShimmer = true;
              //     innerCtrl.appCtrl.update();
              //     innerCtrl.goToShopPage(
              //         innerCtrl.categoryModel!.title.toString());
              //     await Future.delayed(DurationClass.s1);
              //     innerCtrl.appCtrl.isShimmer = false;
              //     innerCtrl.appCtrl.update();
              //     Get.forceAppUpdate();
              //   },
              // ),
            //inner category layout expandable
            const InnerCategoryLayout(),
            const Space(0, 10),

            //trending category layout
            const CommonTrendingCategory(),
            const Space(0, 10),

            //brands layout
            const InnerCategoryBrands()
          ]),
        );
      }
    );
  }
}
