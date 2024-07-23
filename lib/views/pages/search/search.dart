
import 'package:multikart/config.dart';
import 'package:multikart/views/pages/search/search_layouts/recent_search_card.dart';
import 'package:multikart/views/pages/search/search_layouts/recommended_layout.dart';
import 'package:multikart/views/pages/search/search_utils/search_constant.dart';
import 'package:multikart/views/pages/search/search_utils/search_widget.dart';
import '../shop/shop_list_layout.dart';
import 'package:multikart/controllers/pages_controller/search_controller.dart' as search;

class Search extends StatelessWidget {
  final searchCtrl = Get.put(search.SearchController());

  Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<search.SearchController>(builder: (_) {
      return Directionality(
        textDirection:
            searchCtrl.appCtrl.isRTL || searchCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          body: GetBuilder<ShopController>(
            builder: (shopCtrl) {
              return SingleChildScrollView(
                child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SearchWidget().searchAndBackArrow(searchCtrl.controller,
                      shopController: searchCtrl.shopCtrl),
                  searchCtrl.controller.text.isNotEmpty
                      ? const ShopListLayout()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //recent search list layout
                            SearchWidget().commonText(SearchFont().recentSearch),
                            ...searchCtrl.recentSearchList.map((e) {
                              return RecentSearchCard(data: e);
                            }).toList(),
                            const Space(0, 20),
                            SearchWidget()
                                .commonText(SearchFont().recommendedForYou),
                            //recommended list layout
                            const RecommendedLayout(),
                            const Space(0, 30),
                            SearchWidget()
                                .commonText(SearchFont().trendingCategory),
                            //trending category layout
                            const CommonTrendingCategory(),
                            const Space(0, 20),
                            SearchWidget()
                                .commonText(SearchFont().topBrandForMultikart),

                            //brand list layout
                            const CommonBrandLayout()
                          ],
                        )
                ]),
              );
            }
          )
        )
      );
    });
  }
}
