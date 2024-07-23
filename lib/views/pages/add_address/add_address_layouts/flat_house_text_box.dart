import '../../../../config.dart';

class FlatHouseTextBox extends StatelessWidget {
  const FlatHouseTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
      builder: (addAddressCtrl) {
        return CustomTextFormField(
          radius: 5,
          labelText: AddAddressFont().flatHouseBuilding,
          controller: addAddressCtrl.txtFlatHouseBuilding,
          focusNode: addAddressCtrl.flatHouseBuildingFocus,
          keyboardType: TextInputType.name,
          onFieldSubmitted: (value) {
            AddAddressWidget().fieldFocusChange(
                context,
                addAddressCtrl.flatHouseBuildingFocus,
                addAddressCtrl.areaColonyStreetFocus);
          },
        );
      }
    );
  }
}
