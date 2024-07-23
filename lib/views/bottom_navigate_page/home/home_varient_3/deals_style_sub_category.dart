import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_3/deal_style_list_card.dart';

import '../../../../../config.dart';

class DealStyleSubCategory extends StatelessWidget {
  const DealStyleSubCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient3Controller>(builder: (homeCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: homeCtrl.findStyleCategoryCategoryWiseList.length,
        itemBuilder: (context, index) {
          return DealStyleListCard(
            data: homeCtrl.findStyleCategoryCategoryWiseList[index],
            index: index,
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height /
                  (MediaQuery.of(context).size.width < 370
                      ? 1.2
                      : MediaQuery.of(context).size.width < 380
                          ? 1.0
                          : MediaQuery.of(context).size.width > 400
                              ? 1.2
                              : 1.3)),
        ),
      );
    });
  }
}
