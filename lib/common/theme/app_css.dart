import '../../config.dart';

part 'scale.dart';

class AppCss {
  static const TextStyle poppins = TextStyle(
    fontFamily: Fonts.poppins,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1,
  );


  //Text Style
  static TextStyle get h1 => poppins.bold.size(FontSizes.f18).letterSpace(.7);
  static TextStyle get h2 => poppins.semiBold.size(FontSizes.f16).letterSpace(.7);
  static TextStyle get h3 => poppins.semiBold.size(FontSizes.f14);

  static TextStyle get body1 => poppins.size(FontSizes.f14);
  static TextStyle get body2 => poppins.size(FontSizes.f12);
  static TextStyle get body3 => poppins.size(FontSizes.f11);
  static TextStyle get body4 => poppins.size(FontSizes.f10);

  static TextStyle get caption => poppins.size(FontSizes.f11).letterSpace(.3);
  static TextStyle get footnote => poppins.bold.size(FontSizes.f11);
}
