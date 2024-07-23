import 'package:multikart/config.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';
import 'package:multikart/shimmer_layouts/home_shimmer/home_shimmer_v2.dart';
import 'package:multikart/shimmer_layouts/home_shimmer/home_shimmer_v3.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/biggest_deal_brands.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/divider_image.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/home_category_list.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/new_drops.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/static_banner_varient2.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/home_banner_list.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/search_text_box.dart';


class HomeVarient2Screen extends StatefulWidget {
  const HomeVarient2Screen({Key? key}) : super(key: key);

  @override
  State<HomeVarient2Screen> createState() => _HomeVarient2ScreenState();
}

class _HomeVarient2ScreenState extends State<HomeVarient2Screen> {
  final homeCtrl = Get.put(HomeVarient2Controller());
  final homeCtrl2 = Get.put(HomeVarient3Controller());
  final homeCtrl3 = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient2Controller>(builder: (_) {
      return Directionality(
        textDirection:
            homeCtrl.appCtrl.isRTL || homeCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: homeCtrl.appCtrl.isShimmer
                ? const Homev2Shimmer()
                : SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                        //home category list layout
                        SearchHomeTextBox(
                          prefixIcon: SearchWidget().prefixIcon(),
                        ),

                        //banner list layout
                        const HomeBannerVarient2List(),

                        //home category list layout
                        const HomeVarient2CategoryList(),

                        const HomeStaticBannerVarient2(),

                        const DividerImage(),
                        const Space(0, 15),
                        //biggest deal of brands
                        const DealsHomeBrands(),
                        const Space(0, 15),
                        const DividerImage(),
                        //Product corner
                        NewDropCorner(index: 0),
                        const Space(0, 15),
                        //Product corner
                        NewDropCorner(
                          index: 1,
                        ),
                        const Space(0, 15),
                      ]))),
      );
    });
  }
}
