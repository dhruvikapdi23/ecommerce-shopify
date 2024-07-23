import 'package:multikart/config.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient2_controller.dart';
import 'package:multikart/controllers/home_product_controllers/home_varient3_controller.dart';
import 'package:multikart/shimmer_layouts/home_shimmer/home_shimmer_v3.dart';
import 'package:multikart/shimmer_layouts/home_shimmer/home_shimmer_v2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCtrl = Get.put(HomeController());
  final homeCtrl2 = Get.put(HomeVarient2Controller());
  final homeCtrl3 = Get.put(HomeVarient3Controller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Directionality(
        textDirection:
            homeCtrl.appCtrl.isRTL || homeCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: homeCtrl.appCtrl.isShimmer
                ? const HomerShimmer()
                : SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                        //home category list layout
                        HomeCategoryList(),
                        // border line layout

                        BorderLineLayout(),
                        //banner list layout

                        HomeBannerList(),

                        //deals of the day
                        HomeDealsOfTheDayLayout(),

                        // border line layout
                        BorderLineLayout(),

                        //find your style
                        FindYourStyle(),

                        //offer time banner
                        OfferTimeLayout(),

                        //biggest deal of brands
                        DealsBrands(),

                        // border line layout
                        BorderLineLayout(),

                        //kids corner
                        KidsCorner(),

                        //offer corner
                        OfferCorner()
                      ]))),
      );
    });
  }
}
