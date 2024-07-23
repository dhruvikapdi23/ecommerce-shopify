import '../../config.dart';

class RowListShimmer extends StatelessWidget {
  const RowListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...AppArray().homeKidsCornerList.map((e) {
            return ProductShimmer(
              width: MediaQuery.of(context).size.width / 3,
            ).marginOnly(
                right: AppScreenUtil().screenWidth(10));
          }).toList()
        ]))
        .marginSymmetric(
        horizontal: AppScreenUtil().screenWidth(15));
  }
}
