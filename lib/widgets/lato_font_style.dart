import '../config.dart';

class LatoFontStyle extends StatelessWidget {
  final String? text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;
  final GestureTapCallback? onTap;
  final TextOverflow overflow;
  final double? letterSpacing;
  final TextAlign textAlign;

  const LatoFontStyle(
      {Key? key,
      this.text,
      this.color,
      this.onTap,
      this.letterSpacing,
      this.fontWeight = FontWeight.normal,
      this.fontSize = FontSizes.f16,
      this.textDecoration = TextDecoration.none,
      this.textAlign = TextAlign.left,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Text(text!,
            overflow: overflow,
            textAlign: textAlign,
            style: GoogleFonts.lato(
              color: color,
              fontSize: AppScreenUtil().fontSize(fontSize),
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              decoration: textDecoration,
            )));
  }
}
