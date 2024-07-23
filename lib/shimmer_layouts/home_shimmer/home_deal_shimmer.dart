import 'package:multikart/config.dart';


class DealOfTheDayShimmer extends StatelessWidget {
  const DealOfTheDayShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...AppArray().homeDealOfTheDayList.map((e) {
              return const DealCardShimmer()
                  .paddingSymmetric(vertical: AppScreenUtil().screenHeight(5))
                  .marginSymmetric(
                  horizontal: AppScreenUtil().screenWidth(15));
            }).toList(),
          ],
        );
      }
    );
  }
}
