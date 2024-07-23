import '../../../../config.dart';

class CurrentPasswordTextForm extends StatelessWidget {
  const CurrentPasswordTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetPasswordController>(builder: (resetPasswordController) {
      return Padding(
        padding:
        EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: CustomTextFormField(
          radius: 5,
          labelText: ResetPasswordFont().currentPassword,
          controller: resetPasswordController.txtCurrent,
          focusNode: resetPasswordController.currentFocus,
          keyboardType: TextInputType.text,
          onFieldSubmitted: (value) {
            SignUpWidget().fieldFocusChange(
                context, resetPasswordController.currentFocus, resetPasswordController.passwordFocus);
          },
          validator: (value) => CommonValidation().checkCurrentPasswordValidation(value),
        ),
      );
    });
  }
}
