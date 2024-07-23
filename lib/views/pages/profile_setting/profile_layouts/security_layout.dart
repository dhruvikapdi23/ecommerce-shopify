import 'package:multikart/config.dart';

class SecurityLayout extends StatelessWidget {
  const SecurityLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileWidget().commonTitleTextLayout(ProfileFont().security),
          const Space(0, 30),
          ProfileWidget().securityTextBox(ProfileFont().dob,
              keyboardType: TextInputType.phone,
              focusNode: profileCtrl.mobileNumberFocus,
              controller: profileCtrl.txtPhone,
              onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
              context,
              profileCtrl.mobileNumberFocus,
              profileCtrl.passwordFocus,
            );
          }),
          const Space(0, 30),
          ProfileWidget().securityTextBox(ProfileFont().password,
              controller: profileCtrl.txtPassword,
              focusNode: profileCtrl.passwordFocus,
              keyboardType: TextInputType.name)
        ],
      );
    }).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
  }
}
