import '../../../config.dart';

class Filter extends StatelessWidget {
  final filterCtrl = Get.put(FilterController());

  Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (shopCtrl) {
      return GetBuilder<FilterController>(builder: (_) {
        return Directionality(
          textDirection: appCtrl.isRTL || appCtrl.languageVal == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
              appBar: AppBar(
                  elevation: 0,
                  title: Text(FilterFont().filters),
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  actions: const [CloseSquareIcon()]),
              body: Stack(children: [
                SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      // FilterWidget().titleText(FilterFont().shortBy),
                      // const Space(0, 20),

                      //short by layout
                      // const SortByLayout(),

                      // FilterWidget().titleText(FilterFont().brandsFilter),
                      //brand layout
                      // const BrandLayout(),

                      FilterWidget().titleText(FilterFont().size),
                      // size layout
                      const SizeLayout(),
                      const Space(0, 20),
                      FilterWidget().titleText(FilterFont().price),

                      const Space(0, 20),
                      // range slider
                      const RangeValueLayout(),
                      const CustomRangeSlider(),
                      // const Space(0, 20),
                      // FilterWidget().titleText(FilterFont().occasion),

                      // //occasion layout
                      // const OccasionLayout(),
                      const Space(0, 20),
                      FilterWidget().titleText(FilterFont().colors),

                      //color layout
                      const ColorLayout(),
                      const Space(0, 20)
                    ]).marginSymmetric(
                        horizontal: AppScreenUtil().screenWidth(15))),
                BottomLayout(
                        firstButtonText: FilterFont().reset,
                        secondButtonText: FilterFont().applyFilter,
                        firstTap: () => {
                              filterCtrl.resetFilter(),
                              shopCtrl.resetFilter(),
                              Get.back()
                            },
                        secondTap: () => {shopCtrl.filterDoneTap(), Get.back()})
                    .alignment(Alignment.bottomCenter)
              ])),
        );
      });
    });
  }
}
