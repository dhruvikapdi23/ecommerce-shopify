import '../../../config.dart';

class OnBoardWidget {
  //image layout
  Widget imageLayout(image) {
    return Container(
      color: Colors.transparent,
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(7)),
        child: Image.asset(image,
            fit: BoxFit.fill, width: AppScreenUtil().screenWidth(900.0)));
  }

  Widget networkImageLayout(image) {
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(7)),
        child: Image.network(image,
            fit: BoxFit.fill, width: AppScreenUtil().screenWidth(900.0)));
  }

  //text Layout
  Widget textLayout(
      {String? text,
      double? fontSize,
      var fontWeight,
      var color,
      TextDecoration textDecoration = TextDecoration.none}) {
    return Text(text!)
        .fontSize(AppScreenUtil().fontSize(fontSize!))
        .fontWeight(fontWeight)
        .fontFamily(GoogleFonts.lato().fontFamily.toString())
        .textColor(color)
        .textAlignment(TextAlign.center)
        .textDecoration(textDecoration);
  }
}
