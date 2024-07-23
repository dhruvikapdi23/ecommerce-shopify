import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_3/deals_of_the_day_card.dart';

import '../../../../../config.dart';

class HomeV3DealsOfTheDayLayout extends StatelessWidget {
  const HomeV3DealsOfTheDayLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient3Controller>(builder: (homeCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: Column(
          children: [
            RowTextLayout(
              text1: HomeFont().dealsOfTheDay,
              text2: HomeFont().seeAll,
              fontWeight1: FontWeight.w700,
              fontWeight2: FontWeight.normal,
            ),
            const Space(0, 10),
            ...homeCtrl.dealOfTheDayList
                .asMap()
                .entries
                .map((e) => DealsOfTheDayCardV3(
                      index: e.key,
                      data: e.value,
                    )),
            const Space(0, 10),
          ],
        ),
      );
    });
  }
}
