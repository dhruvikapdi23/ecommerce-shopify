import 'package:multikart/config.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';
import 'package:multikart/shimmer_layouts/home_shimmer/home_shimmer_v2.dart';
import 'package:multikart/shimmer_layouts/home_shimmer/home_shimmer_v3.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_2/search_text_box.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_3/biggest_deal_style.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_3/home_V3_category_list.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_3/home_deals_of_the_days.dart';
import 'package:multikart/views/bottom_navigate_page/home/home_varient_3/search_text_box.dart';

class HomeVarient3Screen extends StatefulWidget {
  const HomeVarient3Screen({Key? key}) : super(key: key);

  @override
  State<HomeVarient3Screen> createState() => _HomeVarient3ScreenState();
}

class _HomeVarient3ScreenState extends State<HomeVarient3Screen> {
  final homeCtrl = Get.put(HomeVarient3Controller());
  final homeCtrl2 = Get.put(HomeVarient2Controller());
  final homeCtrl3 = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeVarient3Controller>(builder: (_) {
      return Directionality(
        textDirection:
            homeCtrl.appCtrl.isRTL || homeCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: homeCtrl.appCtrl.isShimmer
                ? const HomeV3Shimmer()
                : SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                        //home category list layout
                        SearchHomeVariant3TextBox(
                          prefixIcon: SearchWidget().prefixIcon(),
                        ),

                        //home category list layout
                        const HomeV3CategoryList(),

                        //deals of the day
                        const HomeV3DealsOfTheDayLayout(),

                        //Biggest Deal style
                        const BiggestDealStyle(),
                      ]))),
      );
    });
  }
}
