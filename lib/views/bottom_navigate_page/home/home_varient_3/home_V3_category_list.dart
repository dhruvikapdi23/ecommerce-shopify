import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_3/home_category_data.dart';

import '../../../../../config.dart';

class HomeV3CategoryList extends StatelessWidget {
  const HomeV3CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<HomeVarient3Controller>(builder: (homeCtrl) {
        return SizedBox(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: homeCtrl.findStyleCategoryCategoryWiseList.length,
            itemBuilder: (context, index) {
              return HomeV3CategoryData(
                data: homeCtrl.homeCategoryList[index],
                index: index,
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
          ),
        );
      });
    });
  }
}
