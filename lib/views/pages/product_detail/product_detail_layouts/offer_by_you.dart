import '../../../../config.dart';

class OfferByYou extends StatelessWidget {
  final Offer? offer;

  const OfferByYou({Key? key, this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailWidget().commonText(
            text: ProductDetailFont().offersForYou,
            fontSize: FontSizes.f14),

        ProductDetailWidget().commonText(
            text: offer!.title!=null ? offer!.title.toString().tr : '',
            fontSize: FontSizes.f14),
        ProductDetailWidget().descriptionText(offer!.desc != null ? offer!.desc.toString().tr : ''),
        ProductOffer(
          text: offer!.code != null ? offer!.code.toString().tr : '',
        ).marginOnly(bottom: AppScreenUtil().screenHeight(10))
      ],
    );
  }
}
