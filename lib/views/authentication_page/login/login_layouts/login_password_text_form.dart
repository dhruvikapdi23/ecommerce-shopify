import '../../../../config.dart';

class LoginPasswordTextForm extends StatelessWidget {
  const LoginPasswordTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginCtrl) {
      return PasswordTextForm(
        controller: loginCtrl.txtPassword,
        validator: (value) => CommonValidation().checkPasswordValidation(value),
        label:  CommonTextFont().password,
        passwordVisible: loginCtrl.passwordVisible,
        passwordFocus: loginCtrl.passwordFocus,
        suffixIcon: InkWell(
          onTap: loginCtrl.toggle,
          child: loginCtrl.passwordVisible
              ? Icon(
                  FontAwesomeIcons.eyeSlash,
                  color: loginCtrl.appCtrl.appTheme.contentColor,
                  size: AppScreenUtil().size(16),
                )
              : Icon(FontAwesomeIcons.eye,
                  color: loginCtrl.appCtrl.appTheme.contentColor,
                  size: AppScreenUtil().size(16)),
        ),
      );
    });
  }
}
