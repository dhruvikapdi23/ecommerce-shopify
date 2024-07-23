import '../../../../config.dart';

class OrderHistoryFilterLayout extends StatelessWidget {
  final GestureTapCallback? onTap;
  final int? index,value;
  final String? text;
  const OrderHistoryFilterLayout({Key? key,this.onTap,this.value,this.index,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return InkWell(
          onTap: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomRadio(
                  index: index,
                  selectRadio: value,
                  isBorderColor: true,
                  onTap: onTap),
              const Space(10, 0),
              LatoFontStyle(
                text: text,
                color: appCtrl.appTheme.contentColor,
                fontSize: FontSizes.f14,
              )
            ],
          ).marginOnly(
              left: AppScreenUtil().screenWidth(20),
              bottom: AppScreenUtil().screenHeight(10)),
        );
      }
    );
  }
}
