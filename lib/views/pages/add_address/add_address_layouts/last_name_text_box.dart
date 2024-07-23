
import '../../../../config.dart';

class LastNameTextBox extends StatelessWidget {
  const LastNameTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(builder: (addAddressCtrl) {
      return CustomTextFormField(
        radius: 5,
        labelText: AddAddressFont().lastName,
        controller: addAddressCtrl.txtLastName,
        focusNode: addAddressCtrl.lastNameFocus,
        keyboardType: TextInputType.name,
        onFieldSubmitted: (value) {
          AddAddressWidget().fieldFocusChange(context,
              addAddressCtrl.lastNameFocus, addAddressCtrl.mobileNumberFocus);
        },
      );
    });
  }
}
