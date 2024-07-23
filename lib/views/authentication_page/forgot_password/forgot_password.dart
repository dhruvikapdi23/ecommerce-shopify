import '../../../config.dart';

class ForgotPassWordScreen extends StatelessWidget {
  final forgotPasswordCtrl = Get.put(ForgotPasswordController());

  ForgotPassWordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(builder: (_) {
      return Directionality(
        textDirection: forgotPasswordCtrl.appCtrl.isRTL ||
                forgotPasswordCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
          //app bar layout
          AuthenticationAppBar(
            isDone: false,
            onTap: () => Get.toNamed(routeName.dashboard),
          ),
          const Space(0, 20),

          //title and description text layout
          ForgotPasswordWidget().loginLayout(
              child: AuthenticationTitleText(
                  text1: ForgotPasswordFont().forgotPasswordTitle,
                  isTextShow: false),
              context: context),
          const Space(0, 35),

          //email text box filed
          const ForgotPasswordEmailTextForm(),
          const Space(0, 30),

          //button layout
          CustomButton(
              title: ForgotPasswordFont().sendOtp.toUpperCase(),
              onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    forgotPasswordCtrl.sendOtp();
                  }),
          const Space(0, 30),

          //back and sign in button layout
          CommonAccountText(
              text1: ForgotPasswordFont().backTo,
              text2: ForgotPasswordFont().signIn,
              textColor: forgotPasswordCtrl.appCtrl.appTheme.blackColor,
              fontWeight: FontWeight.normal,
              onTap: () => Get.back())
        ]))),
      );
    });
  }
}
