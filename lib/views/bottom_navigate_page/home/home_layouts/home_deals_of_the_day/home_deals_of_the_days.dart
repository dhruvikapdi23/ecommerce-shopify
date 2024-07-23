import '../../../../../config.dart';

class HomeDealsOfTheDayLayout extends StatelessWidget {
  const HomeDealsOfTheDayLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
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
                .map((e) => DealsOfTheDayCard(
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
