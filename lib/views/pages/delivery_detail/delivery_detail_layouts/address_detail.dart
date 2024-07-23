import 'package:multikart/shopify/models/address.dart';

import '../../../../config.dart';

class AddressDetail extends StatelessWidget {
  final Address? addressList;
  final int? index;
  final int? selectRadio;
  final bool isShow;

  const AddressDetail(
      {Key? key,
      this.selectRadio,
      this.index,
      this.addressList,
      this.isShow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            LatoFontStyle(
                text: addressList!.firstName.toString().tr,
                fontWeight: FontWeight.w600,
                fontSize: FontSizes.f13,
                color: appCtrl.appTheme.blackColor),
          ],
        ),
        const Space(0, 5),
        DeliveryDetailWidgets()
            .addressCommonText(addressList!.street.toString().tr),
       /* Row(children: [
          DeliveryDetailWidgets()
              .addressCommonText(addressList!.block.toString().tr),
          const Text(", "),
          DeliveryDetailWidgets()
              .addressCommonText(addressList!.state.toString().tr)
        ])*/
        RichText(
          text: TextSpan(

            children: [
              TextSpan(
                text:addressList!.block.toString().tr,
                style: TextStyle(
                  fontFamily: GoogleFonts.lato().fontFamily,
                  fontSize: 13,
                  color: appCtrl.appTheme.contentColor
                )
              ),
              TextSpan(
                text:", ",
                  style: TextStyle(
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontSize: 13,
                      color: appCtrl.appTheme.contentColor
                  )
              ),
              TextSpan(
                text:addressList!.state.toString().tr,
                  style: TextStyle(
                      fontFamily: GoogleFonts.lato().fontFamily,
                      fontSize: 13,
                      color: appCtrl.appTheme.contentColor
                  )
              ),
            ],
          ),
        ) ,
        LatoFontStyle(
            text:
                "${addressList!.city.toString().tr}-${addressList!.zipCode.toString().tr}",
            fontWeight: FontWeight.normal,
            fontSize: FontSizes.f13,
            color: appCtrl.appTheme.contentColor),
        const Space(0, 5),
        Row(children: [
          DeliveryDetailWidgets().phoneCommonText(DeliveryDetailFont().phoneNo),
          DeliveryDetailWidgets()
              .phoneCommonText(addressList!.phoneNumber.toString().tr)
        ]),
      ]);
    });
  }
}
