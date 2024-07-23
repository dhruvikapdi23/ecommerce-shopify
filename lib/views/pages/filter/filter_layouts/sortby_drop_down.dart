import '../../../../config.dart';

class SortByDropDown extends StatelessWidget {
  const SortByDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: (shopCtrl) {
      return DropdownButton(
        value: shopCtrl.dropDownVal,
        items: [
          //add items in the dropdown
          DropdownMenuItem(
            value: "Recommended",
            child: Text(FilterFont().recommended),
          ),
          DropdownMenuItem(
              value: "Popularity", child: Text(FilterFont().popularity)),
          DropdownMenuItem(
            value: "What's New",
            child: Text(FilterFont().whatsNew),
          ),
          DropdownMenuItem(
            value: "Price: High to Low",
            child: Text(FilterFont().highToLow),
          ),
          DropdownMenuItem(
            value: "Price: Low to High",
            child: Text(FilterFont().lowToHigh),
          ),
          DropdownMenuItem(
            value: "Customer Rating",
            child: Text(FilterFont().customerRating),
          )
        ],
        onChanged: (value) {
          //get value when changed
          shopCtrl.dropDownVal = value.toString();
          shopCtrl.update();
        },
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: appCtrl.appTheme.blackColor,
        ),
        //Icon color
        style: TextStyle(
            //te
            color: appCtrl.appTheme.blackColor, //Font color
            fontFamily: GoogleFonts.mulish().fontFamily,
            fontSize: AppScreenUtil().fontSize(FontSizes
                .f14) //font size on dropdown button
            ),
        underline: Container(),
        //remove underline
        isExpanded: true, //make true to make width 100%
      );
    });
  }
}
