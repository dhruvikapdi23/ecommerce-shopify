
import '../../../../config.dart';

class OtpNumberLayout extends StatelessWidget {
  const OtpNumberLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (otpCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          OtpTextForm(
            controller: otpCtrl.fieldOne,
            autoFocus: false,
          ),
          const Space(10, 0),
          OtpTextForm(controller: otpCtrl.fieldTwo, autoFocus: false),
          const Space(10, 0),
          OtpTextForm(controller: otpCtrl.fieldThree, autoFocus: false),
          const Space(10, 0),
          OtpTextForm(controller: otpCtrl.fieldFour, autoFocus: false)
        ],
      );
    });
  }
}
