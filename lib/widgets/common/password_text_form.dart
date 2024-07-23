import '../../config.dart';

class PasswordTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final bool? passwordVisible;
  final FocusNode? passwordFocus;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final ValueChanged<String>? onFieldSubmitted;
  final String? label;
  const PasswordTextForm({Key? key,this.passwordVisible,this.controller,this.passwordFocus,this.suffixIcon,this.validator,this.label,this.onFieldSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15)),
      child: CustomTextFormField(
        radius: 5,
        onFieldSubmitted: onFieldSubmitted,
        labelText: label,
        controller: controller,
        obscureText: passwordVisible!,
        focusNode: passwordFocus,
        validator: validator,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
