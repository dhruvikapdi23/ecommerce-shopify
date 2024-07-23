import '../../../../config.dart';

class PhoneTextBox extends StatelessWidget {
  const PhoneTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
      builder: (addAddressCtrl) {
        return CustomTextFormField(
          radius: 5,
          labelText: AddAddressFont().mobileNumber,
          controller: addAddressCtrl.txtMobileNumber,
          focusNode: addAddressCtrl.mobileNumberFocus,
          keyboardType: TextInputType.phone,
          onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
                context,
                addAddressCtrl.mobileNumberFocus,
                addAddressCtrl.mobileNumberFocus);
          },
        );
      }
    );
  }
}
