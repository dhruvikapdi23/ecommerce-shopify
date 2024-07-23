import 'package:multikart/config.dart';

class SignUpScreen extends StatelessWidget {
  final signUpCtrl = Get.put(SignUpController());

  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (_) {
      return AppComponent(
        child: Scaffold(
          body: Directionality(
            textDirection: signUpCtrl.appCtrl.isRTL ||
                    signUpCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Form(
                key: signUpCtrl.signupFormKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  //app bar layout
                  AuthenticationAppBar(
                      isDone: false,
                      onTap: () => Get.toNamed(routeName.dashboard)),
                  const Space(0, 20),

                  //hey and sign up text layout
                  SignUpWidget().layout(
                      child: AuthenticationTitleText(
                          text1: SignUpFont().hey,
                          text2: SignUpFont().signUp,
                          isTextShow: true),
                      context: context),
                  const Space(0, 35),

                  //name text box layout
                  const SignupNameTextForm(),
                  const Space(0, 15),

                  //email text box layout
                  const SignUpEmailPhoneTextForm(),
                  const Space(0, 15),

                  //password text box layout
                  const SignUpPasswordTextForm(),
                  const Space(0, 35),

                  //button layout
                  CustomButton(
                      title: SignUpFont().signUp.toUpperCase(),
                      onTap: () => {
                            FocusManager.instance.primaryFocus?.unfocus(),
                            signUpCtrl.signIn()
                          }),
                  const Space(0, 20),

                  //or sign in with text layout
                  // const OrSignInWith(),
                  // const Space(0, 20),

                  //social login layout
                  // SocialLoginLayout(),
                  // const Space(0, 30),

                  //already account and sign in layout
                  // CommonAccountText(
                  //     text1: CommonTextFont().alreadyAccount,
                  //     text2: CommonTextFont().signIn,
                  //     textColor: signUpCtrl.appCtrl.appTheme.blackColor,
                  //     fontWeight: FontWeight.normal,
                  //     onTap: () => Get.back()),
                  const Space(0, 20)
                ]))
                ),
          ),
        ),
      );
    });
  }
}
