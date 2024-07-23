import '../../../../config.dart';

class ConfirmPasswordTextForm extends StatelessWidget {
  const ConfirmPasswordTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(
        builder: (resetPasswordController) {
      return PasswordTextForm(
        label: ResetPasswordFont().confirmPassword,
        controller: resetPasswordController.txtConfirmPassword,
        validator: (value) => CommonValidation().checkConfirmPasswordValidation(value,resetPasswordController.txtNewPassword.text),
        passwordVisible: resetPasswordController.confirmPasswordVisible,
        passwordFocus: resetPasswordController.confirmFocus,
        suffixIcon: InkWell(
          onTap: resetPasswordController.confirmToggle,
          child: resetPasswordController.confirmPasswordVisible
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
