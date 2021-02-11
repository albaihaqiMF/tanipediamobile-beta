part of 'shared.dart';

Color mainColor = "55DE7C".toColor();
Color greyColor = "8D92A3".toColor();

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);
Text textVersiApp = Text('Ver 1.0', style: greyFontStyle);

TextStyle blackFontBoldStyle = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);

TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);

TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);

const double defaultMargin = 24;
