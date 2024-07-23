import 'package:multikart/config.dart';

class DeliveryInstruction extends StatelessWidget {
  final List<DeliveryInstructionModel>? deliveryInstruction;
  const DeliveryInstruction({Key? key,this.deliveryInstruction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...deliveryInstruction!.map((e) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(20)),
                            height: AppScreenUtil().screenHeight(50),
                            width: AppScreenUtil().screenWidth(50),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: appCtrl.appTheme.greyLight25,
                                shape: BoxShape.circle),
                            child: (e.icon!.contains("svg"))
                                ? SvgPicture.asset(e.icon!)
                                : Image.asset(e.icon!),
                          ),
                          const Space(0, 8),
                          LatoFontStyle(text: e.title,fontSize: FontSizes.f10,color: appCtrl.appTheme.blackColor,)
                        ],
                      );
                    }).toList()
                  ],
                ),
              ),
            ).marginOnly(top: AppScreenUtil().screenHeight(20),bottom: AppScreenUtil().screenHeight(50))
          ],
        );
      }
    );
  }
}
