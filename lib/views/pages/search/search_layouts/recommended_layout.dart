import 'dart:developer';
import 'package:multikart/controllers/pages_controller/search_controller.dart' as search;
import '../../../../config.dart';

class RecommendedLayout extends StatelessWidget {
  const RecommendedLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<search.SearchController>(builder: (searchCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: searchCtrl.recommendedList.length,
        itemBuilder: (context, index) {
          log("rec : ${searchCtrl.recommendedList[index]}");
          return GridviewThreeLayout(
            data: searchCtrl.recommendedList[index]["title"],
            index: index,
            selectIndex: searchCtrl.selectRecommended,
            onTap: () {
              searchCtrl.selectRecommended = index;
              searchCtrl.update();
            },
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / (4.5)),
        ),
      );
    });
  }
}
