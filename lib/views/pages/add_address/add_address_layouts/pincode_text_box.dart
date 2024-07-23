import '../../../../config.dart';

class PinCodeTextBox extends StatelessWidget {
  const PinCodeTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
      builder: (addAddressCtrl) {
        return CustomTextFormField(
          radius: 5,
          labelText: AddAddressFont().pinCodeText,
          controller: addAddressCtrl.txtPinCode,
          focusNode: addAddressCtrl.pinCodeFocus,
          keyboardType: TextInputType.number,
          maxLength: 10,
          onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
                context,
                addAddressCtrl.pinCodeFocus,
                addAddressCtrl.flatHouseBuildingFocus);
          },
        );
      }
    );
  }
}
