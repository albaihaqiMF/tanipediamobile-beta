part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('REGISTER'),
      //   brightness: Brightness.light,
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(
              50, MediaQuery.of(context).size.height / 6, 50, 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 40),
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/logo_text_app.png'))),
                ),
                Column(
                  children: [
                    WrapField(
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          hintText: 'Masukkan Nama',
                          focusColor: Colors.red,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                      ),
                    ),
                    WrapField(
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Masukkan Telepon',
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            counterText: ''),
                        maxLength: 15,
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 10, defaultMargin, 0),
                      child: CustomButton(
                          onPress: () {
                            Get.to(AuthPage(),
                                arguments: '+62${_phoneController.text}');
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         AuthPage('+62${_phoneController.text}')));
                          },
                          text: 'DAFTAR',
                          color: mainColor),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Align(
                      alignment: Alignment.bottomCenter, child: textVersiApp),
                )
              ]),
        ),
      ),
    );
  }
}
