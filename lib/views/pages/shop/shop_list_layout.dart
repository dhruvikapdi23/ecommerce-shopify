import '../../../config.dart';

class ShopListLayout extends StatelessWidget {
  const ShopListLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (shopCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: shopCtrl.homeShopPageList.length,
        itemBuilder: (context, index) {
          return FindStyleListCard(
            data: shopCtrl.homeShopPageList[index],
            onTap: () => appCtrl.goToProductDetail(
                shopCtrl.homeShopPageList[index],
                isHomePage: true),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 0,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / (1.17)),
        ),
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
