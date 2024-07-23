import 'package:multikart/config.dart';

class DeliveryCharges extends StatelessWidget {
  final List<DeliveryChargesInstruction>? deliveryChargesInstruction;
  const DeliveryCharges({Key? key,this.deliveryChargesInstruction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...deliveryChargesInstruction!.map((e) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15),vertical: AppScreenUtil().screenHeight(7)),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: appCtrl.appTheme.greyLight25,
                    borderRadius:
                    BorderRadius.circular(AppScreenUtil().borderRadius(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (e.icon!.contains("svg"))
                        ? SvgPicture.asset(e.icon!,height: AppScreenUtil().screenHeight(15),fit: BoxFit.fill,)
                        : Image.asset(e.icon!,height: AppScreenUtil().screenHeight(25)),
                    const Space(10, 0),
                    LatoFontStyle(
                      text: e.title!.tr,
                      fontWeight: FontWeight.w600,
                      color: appCtrl.appTheme.blackColor,
                      fontSize: FontSizes.f12,
                    )
                  ],
                ),
              );
            }).toList()
          ],
        );
      }
    );
  }
}
