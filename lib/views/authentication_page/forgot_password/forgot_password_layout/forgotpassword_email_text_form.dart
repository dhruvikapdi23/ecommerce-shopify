import '../../../../config.dart';

class ForgotPasswordEmailTextForm extends StatelessWidget {
  const ForgotPasswordEmailTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(builder: (forgotPasswordCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: CustomTextFormField(
          radius: 5,
          labelText: LoginFont().userNameOrEmail,
          controller: forgotPasswordCtrl.txtEmail,
          keyboardType: TextInputType.emailAddress,

          validator: (value) => CommonValidation().checkEmailValidation(value),
        ),
      );
    });
  }
}
