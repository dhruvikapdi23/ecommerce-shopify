import 'package:multikart/controllers/pages_controller/address_list_controller.dart';
import 'package:multikart/shopify/models/address.dart';
import '../../../config.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final addAddressCtrl = Get.put(AddAddressController());

  @override
  void initState() {
    // TODO: implement initState
    final addressListCtrl = Get.isRegistered<AddAddressController>()
        ? Get.find<AddAddressController>()
        : Get.put(AddAddressController());
    if (Get.arguments != null) {
      Address data = Get.arguments;
      addressListCtrl.txtFullName.text = data.firstName!;
      addressListCtrl.txtMobileNumber.text = data.phoneNumber!;
      addressListCtrl.txtFlatHouseBuilding.text = data.block!;
      addressListCtrl.txtAreaColonyStreet.text = data.street!;
      addressListCtrl.txtTownCity.text = data.city!;
      addressListCtrl.txtPinCode.text = data.zipCode!;
      addressListCtrl.countrySelectedValue = data.country!;
      addressListCtrl.stateSelectedValue = data.state!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(builder: (_) {
      return Directionality(
        textDirection: addAddressCtrl.appCtrl.isRTL ||
                addAddressCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            backgroundColor: addAddressCtrl.appCtrl.appTheme.whiteColor,
            title: LatoFontStyle(
              text: AddAddressFont().addANewAddress,
              color: addAddressCtrl.appCtrl.appTheme.blackColor,
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    //form text box
                    FormTextBox(),
                    // Space(0, 10),
                    // BorderLineLayout(),
                    // Space(0, 20),
                    //address list layout
                    // AddressTypeLayout()
                  ],
                ).marginOnly(bottom: AppScreenUtil().screenHeight(100)),
              ),
              //reset and add address layout
              BottomLayout(
                firstButtonText: DeliveryDetailFont().reset,
                secondButtonText: Get.arguments == null
                    ? DeliveryDetailFont().addAddress
                    : DeliveryDetailFont().updateAddress,
                firstTap: () => Get.back(),
                secondTap: () async {    
                 if (Get.arguments == null) {
                    addAddressCtrl.addAddress();
                    } else {
                    addAddressCtrl.updateAddressApi(Get.arguments['id']);
                   }
                  
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
