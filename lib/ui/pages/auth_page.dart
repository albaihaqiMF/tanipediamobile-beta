part of 'pages.dart';

class AuthPage extends StatefulWidget {
  // final String phoneNumber;
  // AuthPage(this.phoneNumber);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _controller = TextEditingController();
  String _verificationCode;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String userId = '5';

    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
              vertical: MediaQuery.of(context).size.height / 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Verifikasi nomor telepon', style: blackFontBoldStyle),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Kode telah dikirimkan ke nomor ${Get.arguments} via SMS',
                      textAlign: TextAlign.center,
                      style: blackFontStyle2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'OTP Code',
                      ),
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      controller: _controller,
                    ),
                  ),
                ],
              ),
              CustomButton(
                  onPress: () async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode,
                              smsCode: _controller.text))
                          .then((value) async {
                        if (value.user != null) {
                          print('STATUS Success : ${value.user}');
                          print('STATUS Success : ${value.user.getIdToken()}');
                          FirebaseServices.registerFirestore(
                              userId, value.user.uid, Get.arguments);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (route) => false);
                        }
                      });
                    } catch (e) {
                      print('STATUS invalid : $e');
                      print('STATUS invalid with message : ${e.message}');
                      _scaffoldkey.currentState
                          .showSnackBar(SnackBar(content: Text('Invalid OTP')));
                      showToast(context, 'Invalid OTP');
                    }
                  },
                  text: 'Verifikasi',
                  color: mainColor),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: Get.arguments,
        verificationCompleted: (PhoneAuthCredential credential) {
          // --------- Auto Login -------- //
          print('FirebaseAuth Complete: $credential');
          FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Get.to(HomePage());
            }
          });
        },
        verificationFailed: (FirebaseException e) {
          print('FirebaseAuth failed: ${e.message}');
          print(e.message);
        },
        codeSent: (String verificationID, int resendToken) {
          print('FirebaseAuth codeSent: $verificationID');
          setState(() {
            _verificationCode = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          print('FirebaseAuth retrievalTimeout: $verificationID');
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
