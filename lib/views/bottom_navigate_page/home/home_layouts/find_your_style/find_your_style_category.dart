import '../../../../../config.dart';

class FindYourStyleCategory extends StatelessWidget {
  const FindYourStyleCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return SizedBox(
        height: AppScreenUtil().size(55),
        child: ListView.builder(
          itemCount: homeCtrl.findStyleCategory.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FindYourStyleCategoryCard(
              index: index,
              selectedStyleCategory: homeCtrl.selectedStyleCategory,
              data: homeCtrl.findStyleCategory[index],
              onTap: () => homeCtrl.subCategoryList(
                  index),
            );
          },
        ),
      );
    });
  }
}
