import '../../../config.dart';

class OtpScreen extends StatelessWidget {
  final otpCtrl = Get.put(OtpController());

  OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Directionality(
          textDirection: otpCtrl.appCtrl.isRTL ||
              otpCtrl.appCtrl.languageVal == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //body layout
                const OtpBody(),

                // done button layout
                CustomButton(
                    title: OtpFont().done.toUpperCase(),
                    onTap: () {
                      Get.back();
                      Get.toNamed(routeName.resetPassword);
                    })
              ])),
        ),
      );
    });
  }
}
