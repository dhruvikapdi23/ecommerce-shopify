
import '../../../../config.dart';

class FullNameTextBox extends StatelessWidget {
  const FullNameTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(builder: (addAddressCtrl) {
      return CustomTextFormField(
        radius: 5,
        labelText: AddAddressFont().fullName,
        controller: addAddressCtrl.txtFullName,
        focusNode: addAddressCtrl.fullNameFocus,
        keyboardType: TextInputType.name,
        onFieldSubmitted: (value) {
          AddAddressWidget().fieldFocusChange(context,
              addAddressCtrl.fullNameFocus, addAddressCtrl.lastNameFocus);
        },
      );
    });
  }
}
