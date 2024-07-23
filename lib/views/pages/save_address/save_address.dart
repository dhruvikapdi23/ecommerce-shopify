import 'package:multikart/config.dart';
import 'package:multikart/controllers/pages_controller/address_list_controller.dart';

class SaveAddress extends StatelessWidget {
  final saveAddressCtrl =  Get.isRegistered<AddressListController>()
      ? Get.find<AddressListController>()
      : Get.put(AddressListController());

  SaveAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(builder: (_) {
      return Directionality(
        textDirection: saveAddressCtrl.appCtrl.isRTL ||
                saveAddressCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            backgroundColor: saveAddressCtrl.appCtrl.appTheme.whiteColor,
            title: LatoFontStyle(
              text: CommonTextFont().savedAddress,
              color: saveAddressCtrl.appCtrl.appTheme.blackColor,
            ),
          ),
          body: SingleChildScrollView(
            child: saveAddressCtrl.appCtrl.isShimmer
                ? const AddressListShimmer()
                : Column(
                    children: [
                      //address list layout
                      if (saveAddressCtrl.deliveryDetail != null)
                        const AddressListLayout(),
                      //add new address button layout
                      const AddAddressButton(),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
