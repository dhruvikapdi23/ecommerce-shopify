import 'package:multikart/config.dart';

class OrderSuccess extends StatelessWidget {
  final orderSuccessCtrl = Get.put(OrderSuccessController());

  OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderSuccessController>(builder: (_) {
      return Directionality(
        textDirection: orderSuccessCtrl.appCtrl.isRTL ||
                orderSuccessCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: const BackArrowButton(),
              backgroundColor: orderSuccessCtrl.appCtrl.appTheme.whiteColor,
              title: Text(OrderSuccessFont().orderPlaced)),
          body: Stack(alignment: Alignment.bottomCenter, children: [
            SingleChildScrollView(
                child: Column(
              children: [
                //check gif layout
                Image.asset(gifAssets.checkCircle),
                const Space(0, 20),

                //order success text layout
                LatoFontStyle(
                    text: OrderSuccessFont().orderSuccess,
                    fontSize: FontSizes.f22,
                    color: orderSuccessCtrl.appCtrl.appTheme.primary,
                    fontWeight: FontWeight.w700),
                const Space(0, 20),

                //order desc layout
                LatoFontStyle(
                        text: OrderSuccessFont().orderDesc,
                        fontSize: FontSizes.f16,
                        color: orderSuccessCtrl.appCtrl.appTheme.blackColor,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center)
                    .paddingSymmetric(
                        horizontal: AppScreenUtil().screenWidth(15)),
                const Space(0, 30),

                //order success detail layout
                 OrderSuccessDetail(order: orderSuccessCtrl.order,),
                const Space(0, 30),
                const BorderLineLayout(),

                //order summary layout
                 OrderSummary(order: orderSuccessCtrl.order,),
                const Space(0, 30)
              ],
            ).width(MediaQuery.of(context).size.width)),
            const OrderSuccessBottom()
          ]),
        ),
      );
    });
  }
}
