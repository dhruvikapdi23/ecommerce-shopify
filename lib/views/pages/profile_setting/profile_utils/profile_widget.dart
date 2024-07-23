import 'package:multikart/config.dart';

class ProfileWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //common title text layout
  Widget commonTitleTextLayout(text) {
    return LatoFontStyle(
        text: text,
        fontSize: FontSizes.f14,
        fontWeight: FontWeight.w700,
        color: appCtrl.appTheme.blackColor);
  }

  //common text box
  Widget commonTextBox(label,
      {TextEditingController? controller,
      FocusNode? focusNode,
      ValueChanged<String>? onFieldSubmitted}) {
    return CustomTextFormField(
        radius: 5,
        labelText: label,
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.name,
        onFieldSubmitted: onFieldSubmitted);
  }

  //common security text box
  Widget securityTextBox(label,
      {TextEditingController? controller,
      FocusNode? focusNode,
      ValueChanged<String>? onFieldSubmitted,final TextInputType? keyboardType}) {
    return CustomTextFormField(
        radius: 5,
        labelText: label,
        controller: controller,
        focusNode: focusNode,
        keyboardType:keyboardType,
        suffixIconConstraints: BoxConstraints(
            minHeight: AppScreenUtil().size(18),
            minWidth: AppScreenUtil().size(18)),
        onFieldSubmitted: onFieldSubmitted,
        suffixIcon: LatoFontStyle(
                text: ProfileFont().change,
                fontWeight: FontWeight.w600,
                fontSize: FontSizes.f12,
                color: appCtrl.appTheme.primary)
            .marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)));
  }
}
