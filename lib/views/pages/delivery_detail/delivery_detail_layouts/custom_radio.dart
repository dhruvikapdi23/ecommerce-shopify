import '../../../../config.dart';

class CustomRadio extends StatelessWidget {
  final int? index;
  final int? selectRadio;
  final GestureTapCallback? onTap;
  final bool isBorderColor;

  const CustomRadio(
      {Key? key,
      this.index,
      this.selectRadio,
      this.onTap,
      this.isBorderColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: isBorderColor
                      ? selectRadio == index
                          ? appCtrl.appTheme.primary
                          : appCtrl.appTheme.borderColor
                      : appCtrl.appTheme.borderColor,
                  width: isBorderColor ? 1.5 : 1.2),
              color: selectRadio == index
                  ? appCtrl.appTheme.whiteColor
                  : appCtrl.appTheme.whiteColor),
          child: Container(
            margin: EdgeInsets.all(AppScreenUtil().size(isBorderColor ? 2 : 6)),
            height: AppScreenUtil().size(8),
            width: AppScreenUtil().size(8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectRadio == index
                    ? appCtrl.appTheme.primary
                    : appCtrl.appTheme.whiteColor),
          ),
        ),
      );
    });
  }
}
