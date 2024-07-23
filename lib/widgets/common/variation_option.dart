import '../../config.dart';

class VariantOptions extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;
  const VariantOptions({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        child: Row(
          children: [
            LatoFontStyle(
              text: text,
              fontSize: FontSizes.f12,
              color: appCtrl.appTheme.blackColor,
              fontWeight: FontWeight.w600,
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: AppScreenUtil().size(16),
              color: appCtrl.appTheme.blackColor,
            )
          ],
        )
            .paddingSymmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(6))
            .decorated(
                color: appCtrl.appTheme.lightGray,
                borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(5))),
      ).gestures(onTap: onTap);
    });
  }
}
