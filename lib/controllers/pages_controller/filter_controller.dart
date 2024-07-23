import '../../config.dart';

class FilterController extends GetxController {

  RangeValues currentRangeValues = const RangeValues(0, 100);
  List brandFilterList = [];
  List occasionFilterList = [];
  List sizeList = [];
  List colorList = [];
  String dropDownVal = "Recommended".tr;
  int selectedBrand = 0;
  int selectedOccasion = 0;
  List selectedColor = [];
  List selectSize = [];
  var data = [
    {"val": "0.0"},
    {"val": "10.0"},
    {"val": "20.0"},
    {"val": "30.0"},
    {"val": "40.0"},
    {"val": "50.0"},
    {"val": "60.0"},
    {"val": "70.0"},
    {"val": "80.0"},
    {"val": "90.0"},
    {"val": "100.0"}
  ];

  //select brand
  selectBrandFunction(index) {
    selectedBrand = index;
    update();
  }

  //select occasion
  selectOccasionFunction(index) {
    selectedOccasion = index;
    update();
  }

  //reset
  resetFilter() {
    dropDownVal = "Recommended".tr;
    selectedBrand = 0;
    selectedOccasion = 0;
    selectedColor = [];
    selectSize = [];
    currentRangeValues = const RangeValues(0, 100);
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    brandFilterList = AppArray().brandFilterList;
    sizeList = AppArray().sizeList;
    occasionFilterList = AppArray().occasionFilterList;
    colorList = AppArray().colorList;

    update();
    super.onReady();
  }
}
