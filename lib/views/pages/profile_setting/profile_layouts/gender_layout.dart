import '../../../../config.dart';

class GenderLayout extends StatelessWidget {
  const GenderLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileCtrl) {
      return SizedBox(
        height: AppScreenUtil().screenHeight(42),
        child: FormField<String>(builder: (FormFieldState<String> state) {
          return InputDecorator(
              decoration: InputDecoration(
                  labelText: AddAddressFont().countryRegion,
                  labelStyle: TextStyle(
                      color: profileCtrl.appCtrl.appTheme.contentColor,
                      fontSize: AppScreenUtil().fontSize(16),
                      letterSpacing: .4),
                  contentPadding: EdgeInsets.only(
                      left: AppScreenUtil().screenHeight(18),
                      right: AppScreenUtil().size(11)),
                  hintText: DeliveryDetailFont().selectCountry,
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: profileCtrl.appCtrl.appTheme.borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: profileCtrl.appCtrl.appTheme.borderColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                    borderSide: BorderSide(
                        style: BorderStyle.solid,
                        color: profileCtrl.appCtrl.appTheme.borderColor),
                  )),
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      value: profileCtrl.genderSelectedValue,
                      isDense: true,
                      isExpanded: true,
                      icon: Icon(Icons.keyboard_arrow_down,
                          color: profileCtrl.appCtrl.appTheme.borderColor),
                      onChanged: (String? newValue) {
                        profileCtrl.genderSelectedValue = newValue!;
                        profileCtrl.update();
                      },
                      items: profileCtrl.gender.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value.tr,
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.lato().fontFamily)));
                      }).toList())));
        }),
      );
    });
  }
}
