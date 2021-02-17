part of 'shared.dart';

Color mainColor = "55DE7C".toColor();
Color accentColor = "B9E77F".toColor();
Color greyColor = "8D92A3".toColor();
Color secondaryColor = 'CAFFD9'.toColor();

Text textVersiApp = Text('Ver 1.0', style: greyFontStyle);

TextStyle greyFontStyle = GoogleFonts.poppins().copyWith(color: greyColor);

TextStyle blackFontBoldStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);

TextStyle blackFontBoldStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);

TextStyle blackFontBoldStyle3 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontWeight: FontWeight.bold);

TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);

TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: Colors.black);

TextStyle blackFontStyle4 =
    GoogleFonts.poppins().copyWith(fontSize: 14, color: Colors.black);

const double defaultMargin = 24;
