import 'dart:convert';
import 'dart:developer';
import 'package:multikart/controllers/pages_controller/address_list_controller.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/utilities/storage_utils.dart';
import '../../config.dart';
import 'package:http/http.dart' as http;

class AddAddressController extends GetxController with ShopifyMixin {
  //text editing controllers
  TextEditingController txtCountry = TextEditingController();
  TextEditingController txtFullName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtPinCode = TextEditingController();
  TextEditingController txtFlatHouseBuilding = TextEditingController();
  TextEditingController txtAreaColonyStreet = TextEditingController();
  TextEditingController txtLandmark = TextEditingController();
  TextEditingController txtTownCity = TextEditingController();
  TextEditingController txtStateProvinceRegion = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //focus node
  final FocusNode countryFocus = FocusNode();
  final FocusNode fullNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode mobileNumberFocus = FocusNode();
  final FocusNode pinCodeFocus = FocusNode();
  final FocusNode flatHouseBuildingFocus = FocusNode();
  final FocusNode areaColonyStreetFocus = FocusNode();
  final FocusNode landmarkFocus = FocusNode();
  final FocusNode townCityFocus = FocusNode();
  final FocusNode stateProvinceRegionFocus = FocusNode();

  String stateSelectedValue = "";
  String countrySelectedValue = "";

  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final addresslistCtrl = Get.isRegistered<AddressListController>()
      ? Get.find<AddressListController>()
      : Get.put(AddressListController());

  List addressType = [];
  int selectRadio = 0;
  bool isChecked = false;
  String value = "home";

  //state list
  var state = [];
  //country list
  var country = [];
  var allCountryList = [];
  String? userId;

  @override
  void onReady() {
    // TODO: implement onReady
    fetchCountryAndState();
    userId = getStorage(Session.userInfo)['id'];
    log("userId : $userId");
    addressType = AppArray().addressType;
    update();
    super.onReady();
  }

  //select address
  selectAddressType(val, index) {
    value = val['title']!;
    selectRadio = index;
    update();
  }

  //update address api calling function
  updateAddressApi(value) {
    Map<String, dynamic> body = {
      "address": {
        "address1": txtFlatHouseBuilding.text,
        "address2": txtAreaColonyStreet.text +
            txtLandmark.text +
            txtStateProvinceRegion.text,
        "city": txtTownCity.text,
        "company": "",
        "first_name": txtFullName.text,
        "last_name": txtLastName.text,
        "phone": txtMobileNumber.text,
        "province": stateSelectedValue,
        "country": countrySelectedValue,
        "zip": txtPinCode.text,
        "id": value
      }
    };
    http.put(
        Uri.parse(
            "${environment["serverConfig"]["domain"]}/admin/api/2023-01/customers/$userId/addresses/$value.json"),
        body: json.encode(body),
        headers: {
          "X-Shopify-Access-Token": environment["serverConfig"]
              ["adminAccessToken"],
          "Content-Type": "application/json"
        }).then((http.Response response) async {
      // snackBar(DeliveryDetailFont().addressUpdate.tr);
      update();
      await Future.delayed(DurationClass.s1);
      addresslistCtrl.customerAddress();
      Get.back();
      Get.forceAppUpdate();
    });
  }

  //add address function
  void addAddress() async {
    if (txtFlatHouseBuilding.text == "" ||
        txtAreaColonyStreet.text == "" ||
        txtLandmark.text == "" ||
        txtTownCity.text == "" ||
        countrySelectedValue == "" ||
        txtFullName.text == "" ||
        txtLastName.text == "" ||
        txtMobileNumber.text == "" ||
        txtPinCode.text == "") {
      Get.snackbar("Alert", "Please fill all address Details");
    } else {
      Map<String, dynamic> json = {
        "address1": txtFlatHouseBuilding.text,
        "address2": txtAreaColonyStreet.text + txtLandmark.text,
        "city": txtTownCity.text,
        "company": "",
        "country": countrySelectedValue,
        "firstName": txtFullName.text,
        "lastName": txtLastName.text,
        "phone": txtMobileNumber.text,
        "zip": txtPinCode.text,
        "province": stateSelectedValue
      };
      dynamic data = await shopifyService.customerAddressCreate(json);
      log("success : $data");
      await Future.delayed(DurationClass.s1);
      addresslistCtrl.customerAddress();
      Get.back();
      Get.forceAppUpdate();
      update();
    }
  }

  //fetch country and state
  fetchCountryAndState() async {
    http.get(
        Uri.parse(
            "${environment["serverConfig"]["domain"]}admin/api/2023-01/countries.json"),
        headers: {
          "X-Shopify-Access-Token": environment["serverConfig"]
              ["adminAccessToken"]
        }).then((http.Response response) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      allCountryList = jsonResponse['countries'];
      countrySelectedValue = jsonResponse['countries'][0]['name'];
      stateSelectedValue = allCountryList[0]['provinces'][0]['name'];
      allCountryList.asMap().entries.map((e) {
        country.add(e.value['name']);
      }).toList();
      update();
      selectState(countrySelectedValue);
    });
  }

  //select state on change function
  selectState(countrySelectedValue) async {
    var stateList = [];
    stateSelectedValue = "";
    var items = allCountryList
        .where((item) => item!['name'] == countrySelectedValue)
        .toList();
    stateSelectedValue = items[0]['provinces'][0]['name'];
    items.asMap().entries.map((e) {
      e.value['provinces'].asMap().entries.map((f) {
        stateList.add(f.value['name']);
      }).toList();
    }).toList();
    state = stateList;
    update();
  }
}
