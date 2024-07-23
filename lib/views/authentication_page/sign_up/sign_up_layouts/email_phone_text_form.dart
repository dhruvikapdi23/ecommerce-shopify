import '../../../../config.dart';

class SignUpEmailPhoneTextForm extends StatelessWidget {
  const SignUpEmailPhoneTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Padding(
        padding:
        EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: CustomTextFormField(
          radius: 5,
          labelText: SignUpFont().emailPhone,
          controller: signUpCtrl.txtEmail,
          focusNode: signUpCtrl.emailFocus,
          keyboardType: TextInputType.emailAddress,
          onFieldSubmitted: (value) {
            SignUpWidget().fieldFocusChange(
                context, signUpCtrl.emailFocus, signUpCtrl.passwordFocus);
          },
          validator: (value) => CommonValidation().checkEmailOrPhoneValidation(value),
        ),
      );
    });
  }
}
