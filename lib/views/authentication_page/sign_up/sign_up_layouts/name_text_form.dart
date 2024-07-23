import '../../../../config.dart';

class SignupNameTextForm extends StatelessWidget {
  const SignupNameTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpCtrl) {
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: CustomTextFormField(
          radius: 5,
          labelText: SignUpFont().name,
          controller: signUpCtrl.txtName,
          focusNode: signUpCtrl.nameFocus,
          keyboardType: TextInputType.text,
          onFieldSubmitted: (value) {
            SignUpWidget().fieldFocusChange(
                context, signUpCtrl.nameFocus, signUpCtrl.emailFocus);
          },
        ),
      );
    });
  }
}
