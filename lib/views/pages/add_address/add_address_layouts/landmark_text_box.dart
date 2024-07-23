import '../../../../config.dart';

class LandmarkTextBox extends StatelessWidget {
  const LandmarkTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
      builder: (addAddressCtrl) {
        return CustomTextFormField(
          radius: 5,
          labelText: AddAddressFont().landmark,
          controller: addAddressCtrl.txtLandmark,
          focusNode: addAddressCtrl.landmarkFocus,
          keyboardType: TextInputType.name,
          onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
                context,
                addAddressCtrl.landmarkFocus,
                addAddressCtrl.townCityFocus);
          },
        );
      }
    );
  }
}
