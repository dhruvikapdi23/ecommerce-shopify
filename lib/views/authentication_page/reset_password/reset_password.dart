import 'package:multikart/config.dart';

class ResetPassword extends StatelessWidget {
  final resetPasswordCtrl = Get.put(ResetPasswordController());

  ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(builder: (_) {
      return Scaffold(
        body: Directionality(
          textDirection: resetPasswordCtrl.appCtrl.isRTL ||
              resetPasswordCtrl.appCtrl.languageVal == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Form(
              key: resetPasswordCtrl.signupFormKey,
              child: SingleChildScrollView(
                  child: Column(children: [
                //appbar layout
                AuthenticationAppBar(
                  isDone: false,
                  onTap: () => Get.toNamed(routeName.dashboard),
                ),
                const Space(0, 20),
                //reset password text layout
                ResetPasswordWidget().layout(
                    child: AuthenticationTitleText(
                        text1: ResetPasswordFont().resetPassword,
                        isTextShow: false),
                    context: context),
                const Space(0, 35),
                const Space(0, 15),
                //current password text box
                const CurrentPasswordTextForm(),
                const Space(0, 15),

                //new password text box
                const NewPasswordTextForm(),
                const Space(0, 15),

                //confirm password text box
                const ConfirmPasswordTextForm(),
                const Space(0, 35),
                //button layout
                CustomButton(
                    title: ResetPasswordFont().resetPassword.toUpperCase(),
                    onTap: () => resetPasswordCtrl.signIn()),
                const Space(0, 20),

                //back to sign layout
                CommonAccountText(
                    text1: ResetPasswordFont().backTo,
                    text2: ResetPasswordFont().signIn,
                    textColor: resetPasswordCtrl.appCtrl.appTheme.blackColor,
                    fontWeight: FontWeight.normal,
                    onTap: () {
                      Get.back();
                      Get.back();
                    }),
                const Space(0, 20),
              ]))),
        ),
      );
    });
  }
}
