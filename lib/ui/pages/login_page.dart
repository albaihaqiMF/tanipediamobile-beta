part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextEditingController namaController = TextEditingController();
  TextEditingController telponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
            width: 110,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image:
                    DecorationImage(image: AssetImage('assets/logo_app.png'))),
          ),
          Container(
            margin: EdgeInsets.only(top: 9, bottom: 36),
            width: 199,
            height: 30,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/text_app.png'))),
          ),
          Center(
            child: Card(
              elevation: 5,
              margin: EdgeInsets.only(top: 20, left: 60, right: 60),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: mainColor,
                  width: 2.0,
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: telponController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: greyFontStyle,
                      hintText: "No. Telepon"),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 74, right: 74),
            child: Center(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: mainColor,
                    width: 2.0,
                  ),
                ),
                child: RaisedButton(
                  color: mainColor,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                      width: 226,
                      height: 44,
                      child: Center(
                          child: Text('Masuk',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)))),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Belum Punya Akun ? ", style: greyFontStyle),
                InkWell(
                    splashColor: greyColor,
                    onTap: () {},
                    child: Text("Daftar", style: TextStyle(color: mainColor)))
              ])),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 5,
            child:
                Align(alignment: Alignment.bottomCenter, child: textVersiApp),
          )
        ],
      ),
    );
  }
}
