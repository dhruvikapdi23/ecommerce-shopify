import '../../../../config.dart';

class OrderDateDeliveryStatus extends StatelessWidget {
  final String? title, value;
  const OrderDateDeliveryStatus({Key? key, this.value, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
            text: title.toString().tr,
            fontWeight: FontWeight.w600,
            fontSize: FontSizes.f12,
            color: appCtrl.appTheme.contentColor,
          ),
          const Space(5, 0),
          LatoFontStyle(
            text: value.toString().tr,
            fontWeight: FontWeight.w600,
            fontSize: FontSizes.f12,
            color: appCtrl.appTheme.blackColor,
          ),
        ],
      );
    });
  }
}
