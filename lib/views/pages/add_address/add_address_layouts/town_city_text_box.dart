import '../../../../config.dart';

class TownCityTextBox extends StatelessWidget {
  const TownCityTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
      builder: (addAddressCtrl) {
        return CustomTextFormField(
          radius: 5,
          labelText: AddAddressFont().townCity,
          controller: addAddressCtrl.txtTownCity,
          focusNode: addAddressCtrl.townCityFocus,
          keyboardType: TextInputType.name,
          onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
                context,
                addAddressCtrl.townCityFocus,
                addAddressCtrl.stateProvinceRegionFocus);
          },
        );
      }
    );
  }
}
