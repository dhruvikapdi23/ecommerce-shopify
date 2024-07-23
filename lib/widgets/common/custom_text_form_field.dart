
import 'package:multikart/config.dart';

class CustomTextFormField extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final TextEditingController? controller;
  final String? hint;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final double? radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final bool? enabled;
  final int? maxLength;
  final bool showCounter;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool showBoarder;
  final TextAlignVertical? textAlignVertical;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final BoxConstraints? suffixIconConstraints;

  CustomTextFormField({
    Key? key,
    this.controller,
    this.hint,
    this.hintText,
    this.labelText,
    this.errorText,
    this.radius,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.obscureText = false,
    this.validator,
    this.padding,
    this.fillColor,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.enabled = true,
    this.maxLength,
    this.showCounter = false,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.showBoarder = true,
    this.suffixIconConstraints,
    this.textAlignVertical = TextAlignVertical.center,

    this.focusNode,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(radius ?? 12)),
      borderSide: BorderSide(
          style: BorderStyle.solid, color: appCtrl.appTheme.borderColor),
    );

    return TextFormField(
      controller: controller,
      style: style ?? AppCss.body1,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      maxLength: maxLength,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      textAlign: TextAlign.justify,
      textAlignVertical: textAlignVertical,
      focusNode: focusNode,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: inputBorder,
          disabledBorder: inputBorder,
          border: inputBorder,
          focusedBorder: inputBorder,
          suffixIconConstraints: suffixIconConstraints,
          errorBorder: inputBorder,
          focusedErrorBorder: inputBorder,
          labelStyle: TextStyle(color: appCtrl.appTheme.contentColor,fontSize: AppScreenUtil().fontSize(16),letterSpacing: .4),
          filled: true,
          fillColor: fillColor ?? appCtrl.appTheme.bg1,
          contentPadding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(20),vertical: AppScreenUtil().screenHeight(0)),
          hintText: hintText,
          labelText: labelText,
          errorText: errorText,
          hintStyle: TextStyle(color: appCtrl.appTheme.contentColor,fontSize: AppScreenUtil().fontSize(16),letterSpacing: .4),
          errorMaxLines: 2,
          counterText: showCounter ? null : '',
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}
