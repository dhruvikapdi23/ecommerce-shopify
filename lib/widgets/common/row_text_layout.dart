import '../../config.dart';

class RowTextLayout extends StatelessWidget {
  final String? text1;
  final String? text2;
  final FontWeight? fontWeight1;
  final FontWeight? fontWeight2;

  const RowTextLayout(
      {Key? key, this.text2, this.text1, this.fontWeight1, this.fontWeight2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LatoFontStyle(
            text: text1,
            color: appCtrl.appTheme.blackColor,
            fontWeight: fontWeight1!,
            fontSize: FontSizes.f14,
          ),
          LatoFontStyle(
            text: text2,
            color: appCtrl.appTheme.primary,
            fontWeight: fontWeight2!,
            fontSize: FontSizes.f14,
          ).gestures(
            onTap: () async {
              appCtrl.isSearch = false;
              appCtrl.selectedIndex = 1;
              appCtrl.update();
              Get.toNamed(routeName.shopPage,arguments: "All");
            },
          ),
        ],
      );
    });
  }
}
