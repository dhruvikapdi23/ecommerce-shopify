
import '../../../../../config.dart';

class InnerCategoryBrands extends StatelessWidget {
  const InnerCategoryBrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InnerCategoryController>(builder: (innerCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
            text: HomeFont().biggestDeal,
            fontSize: FontSizes.f16,
            fontWeight: FontWeight.w700,
            color: innerCtrl.appCtrl.appTheme.blackColor,
          ),
          const Space(0, 10),
         const CommonBrandLayout()
        ],
      ).marginSymmetric(

          horizontal: AppScreenUtil().screenHeight(15));
    });
  }
}
