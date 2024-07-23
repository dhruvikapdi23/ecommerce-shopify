import '../../../../config.dart';

class NewPasswordTextForm extends StatelessWidget {
  const NewPasswordTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(builder: (resetPasswordController) {
      return PasswordTextForm(
        label: ResetPasswordFont().newPassword,
        controller: resetPasswordController.txtNewPassword,
        validator: (value) => CommonValidation().checkNewPasswordValidation(value),
        passwordVisible: resetPasswordController.passwordVisible,
        passwordFocus: resetPasswordController.passwordFocus,
        onFieldSubmitted: (value) {
          ResetPasswordWidget().fieldFocusChange(
              context, resetPasswordController.passwordFocus, resetPasswordController.confirmFocus);
        },
        suffixIcon: InkWell(
          onTap: resetPasswordController.toggle,
          child: resetPasswordController.passwordVisible
              ? Icon(
            FontAwesomeIcons.eyeSlash,
            color: resetPasswordController.appCtrl.appTheme.contentColor,
            size: AppScreenUtil().size(16),
          )
              : Icon(FontAwesomeIcons.eye,
              color: resetPasswordController.appCtrl.appTheme.contentColor,
              size: AppScreenUtil().size(16)),
        ),
      );
    });
  }
}
