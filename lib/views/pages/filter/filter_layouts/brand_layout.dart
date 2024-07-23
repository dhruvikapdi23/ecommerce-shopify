import '../../../../config.dart';

class BrandLayout extends StatelessWidget {
  const BrandLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<FilterController>(
      builder: (filterCtrl) {
        return GridView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: filterCtrl.brandFilterList.length,
          itemBuilder: (context, index) {
            return FindYourStyleCategoryCard(
              index: index,
              isHomePage: false,
              selectedStyleCategory: filterCtrl.selectedBrand,
              data: filterCtrl.brandFilterList[index],
              onTap: () => filterCtrl.selectBrandFunction(index),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / (6.5)),
          ),
        ).marginOnly(bottom: AppScreenUtil().screenHeight(20));
      }
    );
  }
}
