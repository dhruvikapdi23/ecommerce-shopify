import 'dart:developer';
import 'package:multikart/views/pages/add_address/add_address_layouts/last_name_text_box.dart';

import '../../../../config.dart';

class FormTextBox extends StatefulWidget {
  final Map<String, dynamic>? list;

  const FormTextBox({Key? key, this.list}) : super(key: key);

  @override
  State<FormTextBox> createState() => _FormTextBoxState();
}

class _FormTextBoxState extends State<FormTextBox> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(" ${widget.list}");
    return Column(
      children: const [
        FullNameTextBox(),
        Space(0, 30),
        LastNameTextBox(),
        Space(0, 30),
        PhoneTextBox(),
        Space(0, 30),
        FlatHouseTextBox(),
        Space(0, 30),
        AreaColonyTextBox(),
        Space(0, 30),
        LandmarkTextBox(),
        Space(0, 30),
        TownCityTextBox(),
        Space(0, 30),
        PinCodeTextBox(),
        Space(0, 30),
        CountryTextBox(),
        Space(0, 30),
        StateProvisionTextBox(),
      ],
    ).marginSymmetric(
        vertical: AppScreenUtil().screenHeight(20),
        horizontal: AppScreenUtil().screenWidth(15));
  }
}
