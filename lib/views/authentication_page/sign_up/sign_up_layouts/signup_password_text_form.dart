import '../../../../config.dart';

class SignUpPasswordTextForm extends StatelessWidget {
  const SignUpPasswordTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return PasswordTextForm(
        label:  CommonTextFont().password,
        controller: signUpController.txtPassword,
        validator: (value) => CommonValidation().checkPasswordValidation(value),
        passwordVisible: signUpController.passwordVisible,
        passwordFocus: signUpController.passwordFocus,
        suffixIcon: InkWell(
          onTap: signUpController.toggle,
          child: signUpController.passwordVisible
              ? Icon(
            FontAwesomeIcons.eyeSlash,
            color: signUpController.appCtrl.appTheme.contentColor,
            size: AppScreenUtil().size(16),
          )
              : Icon(FontAwesomeIcons.eye,
              color: signUpController.appCtrl.appTheme.contentColor,
              size: AppScreenUtil().size(16)),
        ),
      );
    });
  }
}
