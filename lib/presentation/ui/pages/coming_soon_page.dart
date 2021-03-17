part of 'pages.dart';

class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 350,
                  width: 300,
                  child: Lottie.asset('assets/anim_soon.json'),
                ),
                Text(
                  'COMING SOON',
                  style: blackFontBoldStyle0,
                ),
                Text(
                  'Fitur ini lagi dikembangin..',
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
        ),
      ),
    );
  }
}
