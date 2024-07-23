import '../../../../config.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OtpController>(
      builder: (otpCtrl) {
        return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //code verification text layout
                LatoFontStyle(
                    text: OtpFont().codeVerification,
                    fontWeight: FontWeight.w700,
                    color: otpCtrl.appCtrl.appTheme.blackColor,
                    fontSize: FontSizes.f12),
                const Space(0, 5),
                //email text box layout
                LatoFontStyle(
                    text: OtpFont().enterYourVerificationCode,
                    fontWeight: FontWeight.normal,
                    color: otpCtrl.appCtrl.appTheme.contentColor,
                    fontSize: FontSizes.f14),
                const Space(0, 8),

                //mobile number layout
                const MobileNumberLayout(),
                const Space(0, 15),

                //otp layout
                const OtpNumberLayout(),
                const Space(0, 15),
                // not get code text box
                CommonAccountText(
                    text1: OtpFont().notGetCode,
                    text2: OtpFont().resend,
                    textColor: otpCtrl.appCtrl.appTheme.blackColor,
                    fontWeight: FontWeight.normal,
                    isCenter: false,
                    onTap: () => Get.back()),
                const Space(0, 12)
              ],
            ));
      }
    );
  }
}
