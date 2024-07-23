import '../../../../config.dart';

class BottomLayout extends StatelessWidget {
  final String? firstButtonText, secondButtonText;
  final bool isBorderButton;
  final GestureTapCallback? firstTap, secondTap;

  const BottomLayout(
      {Key? key,
      this.firstButtonText,
      this.secondButtonText,
      this.isBorderButton = true,
      this.firstTap,
      this.secondTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil()
                .screenHeight(MediaQuery.of(context).size.width > 400 ? 10 : 5),
            horizontal: AppScreenUtil().screenWidth(15)),
        decoration: BoxDecoration(
          color: appCtrl.appTheme.whiteColor,
          boxShadow: [
            BoxShadow(
                color: appCtrl.appTheme.lightGray,
                spreadRadius: 10,
                blurRadius: 5,
                offset: const Offset(0, 7) // changes position of shadow
                )
          ],
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: LatoFontStyle(
                  text: firstButtonText,
                  fontSize: FontSizes.f14,
                  textAlign: TextAlign.center,
                ).gestures(onTap: firstTap)),
          ),
          isBorderButton
              ? CustomButton(
                  title: secondButtonText!,
                  height: MediaQuery.of(context).size.width > 400 ? 50 : 35,
                  width: 160,
                  onTap: secondTap)
              : CustomButton(
                  title: secondButtonText!,
                  height: MediaQuery.of(context).size.width > 400 ? 50 : 35,
                  width: MediaQuery.of(context).size.width > 380 ? 160 : 140,
                  onTap: secondTap,
                  color: appCtrl.appTheme.whiteColor,
                  fontSize: FontSizes.f14,
                  border: Border.all(color: appCtrl.appTheme.primary),
                  fontColor: appCtrl.appTheme.primary)
        ]),
      );
    });
  }
}
