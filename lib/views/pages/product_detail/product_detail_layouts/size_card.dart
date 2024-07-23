import '../../../../config.dart';

class SizeCard extends StatelessWidget {
  final String? sizeModel;
  final int? selectSize;
  final int? index;
  final GestureTapCallback? onTap;
  const SizeCard(
      {Key? key, this.sizeModel, this.selectSize, this.index, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: AppScreenUtil().screenHeight(40),
          width: AppScreenUtil().screenWidth(50),
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: AppScreenUtil().screenWidth(10)),
          decoration: BoxDecoration(
              color: selectSize == index
                  ? appCtrl.appTheme.primary
                  : appCtrl.appTheme.greyLight25,
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5))),
          child: LatoFontStyle(
              text: sizeModel!.toString().tr,
              fontSize: FontSizes.f12,
              color: selectSize == index
                  ? appCtrl.appTheme.whiteColor
                  : appCtrl.appTheme.blackColor,
              textDecoration: TextDecoration.none),
        ),
      );
    });
  }
}
