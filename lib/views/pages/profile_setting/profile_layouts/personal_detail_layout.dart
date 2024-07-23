import 'package:multikart/config.dart';

class PersonalDetailLayout extends StatelessWidget {
  const PersonalDetailLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileWidget().commonTitleTextLayout(ProfileFont().personalDetail),
          const Space(0, 20),
          ProfileWidget().commonTextBox(ProfileFont().firstName,
              controller: profileCtrl.txtFirstName,
              focusNode: profileCtrl.firstNameFocus, onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
                context, profileCtrl.firstNameFocus, profileCtrl.lastNameFocus);
          }),
          const Space(0, 30),
          ProfileWidget().commonTextBox(ProfileFont().lastName,
              controller: profileCtrl.txtLastName,
              focusNode: profileCtrl.lastNameFocus, onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
                context, profileCtrl.lastNameFocus, profileCtrl.dobFocus);
          }),
          const Space(0, 30),
          CustomTextFormField(
              radius: 5,
              labelText: ProfileFont().dob,
              controller: profileCtrl.txtDob,
              focusNode: profileCtrl.dobFocus,
              keyboardType: TextInputType.name),
          const Space(0, 30),
          const GenderLayout()
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
