import '../../config.dart';

class CommonTrendingCategory extends StatelessWidget {
  final dynamic data;
  final GestureTapCallback? onTap;

  const CommonTrendingCategory({Key? key, this.data, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        height: AppScreenUtil().screenHeight(160),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: AppArray().innerCategoryProduct.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CategoryCard(
              data: AppArray().innerCategoryProduct[index],
              onTap: () => appCtrl.goToShopPage(
                  AppArray().innerCategoryProduct[index]['title'].toString()),
            ).marginOnly(right: AppScreenUtil().screenWidth(10));
          },
        ),
      );
    });
  }
}
