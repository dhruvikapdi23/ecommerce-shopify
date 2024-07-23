import '../../../../config.dart';

class StateProvisionTextBox extends StatelessWidget {
  const StateProvisionTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(builder: (addAddressCtrl) {
      return addAddressCtrl.stateSelectedValue != ""
          ? SizedBox(
              height: AppScreenUtil().screenHeight(42),
              child: FormField<String>(builder: (FormFieldState<String> state) {
                return InputDecorator(
                    decoration: InputDecoration(
                        labelText: AddAddressFont().stateProvision,
                        labelStyle: TextStyle(
                            color: addAddressCtrl.appCtrl.appTheme.contentColor,
                            fontSize: AppScreenUtil().fontSize(16),
                            letterSpacing: .4),
                        contentPadding: EdgeInsets.only(
                            left: AppScreenUtil().screenHeight(18),
                            right: AppScreenUtil().size(11)),
                        hintText: DeliveryDetailFont().selectState,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                AppScreenUtil().borderRadius(5)),
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: addAddressCtrl
                                    .appCtrl.appTheme.borderColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                AppScreenUtil().borderRadius(5)),
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: addAddressCtrl
                                    .appCtrl.appTheme.borderColor)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                AppScreenUtil().borderRadius(5)),
                            borderSide:
                                BorderSide(style: BorderStyle.solid, color: addAddressCtrl.appCtrl.appTheme.borderColor))),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton<dynamic>(
                            value: addAddressCtrl.stateSelectedValue,
                            isDense: true,
                            isExpanded: true,
                            icon: Icon(Icons.keyboard_arrow_down, color: addAddressCtrl.appCtrl.appTheme.borderColor),
                            onChanged: (dynamic newValue) {
                              addAddressCtrl.stateSelectedValue = newValue!;
                              addAddressCtrl.update();
                            },
                            items: addAddressCtrl.state.map((dynamic value) {
                              return DropdownMenuItem<dynamic>(
                                  value: value,
                                  child: Text(value,
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.lato().fontFamily)));
                            }).toList())));
              }))
          : Container();
    });
  }
}
