import '../../../../config.dart';

class AreaColonyTextBox extends StatelessWidget {
  const AreaColonyTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
      builder: (addAddressCtrl) {
        return CustomTextFormField(
          radius: 5,
          labelText: AddAddressFont().areaColonyStreet,
          controller: addAddressCtrl.txtAreaColonyStreet,
          focusNode: addAddressCtrl.areaColonyStreetFocus,
          keyboardType: TextInputType.name,
          onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
                context,
                addAddressCtrl.areaColonyStreetFocus,
                addAddressCtrl.landmarkFocus);
          },
        );
      }
    );
  }
}
