import 'dart:developer';
import '../../../../config.dart';

class LoginBody extends StatelessWidget {
  final GlobalKey<FormState>? formKey;

  const LoginBody({Key? key, this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return Column(children: [
        //app bar layout
        AuthenticationAppBar(
            isDone: false, onTap: () => Get.toNamed(routeName.dashboard)),
        const Space(0, 20),

        //text and description layout
        LoginWidget().loginLayout(
            child: AuthenticationTitleText(
                text1: LoginFont().hey,
                text2: LoginFont().loginNow,
                isTextShow: true),
            context: context),
        const Space(0, 35),

        //email text box layout
        const LoginEmailTextForm(),
        const Space(0, 15),

        //password text box layout
        const LoginPasswordTextForm(),
        const Space(0, 10),

        //forgot password text layout
        LoginWidget().forgotPasswordLayout(
            onTap: () => Get.toNamed(routeName.forgotPassword),
            color: loginCtrl.appCtrl.appTheme.primary,
            text: LoginFont().forgotPassword),
        const Space(0, 35),

        //button layout
        SignInButton(onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(Get.context!);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
          if (formKey!.currentState!.validate()) {
            loginCtrl.login();
          } else {
            log('No Valid');
          }
        }),
        const Space(0, 20),
        //create new account layout
        const SignUpText(),
        const Space(0, 20)
      ]);
    });
  }
}
