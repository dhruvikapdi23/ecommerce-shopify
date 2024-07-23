import '../../../../../config.dart';

class FindYourStyleCategoryCard extends StatelessWidget {
  final int? selectedStyleCategory;
  final int? index;
  final dynamic data;
  final GestureTapCallback? onTap;
  final bool isHomePage;
  const FindYourStyleCategoryCard(
      {Key? key,
      this.index,
      this.selectedStyleCategory,
      this.data,
      this.onTap,
      this.isHomePage = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: AppScreenUtil().screenHeight(20),
          padding:
              EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
          margin: EdgeInsets.only(
              right: AppScreenUtil().screenWidth(isHomePage
                  ? 15
                  : index!.isEven
                      ? 15
                      : 0),
              top: AppScreenUtil().screenHeight(10),
              bottom: AppScreenUtil().screenHeight(isHomePage ? 10 : 0)),
          decoration: BoxDecoration(
            color: selectedStyleCategory == index
                ? appCtrl.appTheme.primary
                : appCtrl.appTheme.lightGray,
            borderRadius:
                BorderRadius.circular(AppScreenUtil().borderRadius(3)),
          ),
          child: LatoFontStyle(
            text: data['title'].toString().tr,
            color: selectedStyleCategory == index
                ? appCtrl.appTheme.whiteColor
                : appCtrl.appTheme.blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    });
  }
}
