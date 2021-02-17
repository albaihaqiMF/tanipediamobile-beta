part of 'pages.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _otpController = TextEditingController();
  String _verificationCode;
  String _userId = Get.arguments[1];
  String _phoneNumber = Get.arguments[0];
  bool _isLoading = false;
  bool _errorField = false;

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text('Verifikasi nomor telepon', style: blackFontBoldStyle1),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      'Kode telah dikirimkan ke nomor $_phoneNumber via SMS',
                      textAlign: TextAlign.center,
                      style: blackFontStyle2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'OTP Code',
                        errorText:
                            _errorField ? 'Nama tidak boleh kosong' : null,
                      ),
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      controller: _otpController,
                    ),
                  ),
                ],
              ),
              Container(
                child: (_isLoading)
                    ? loadingIndicator
                    : CustomButton(
                        onPress: () async {
                          setState(() {
                            _otpController.text.isEmpty
                                ? _errorField = true
                                : _errorField = false;
                          });
                          if (_errorField == false) {
                            _isLoading = true;
                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId: _verificationCode,
                                          smsCode: _otpController.text))
                                  .then((value) async {
                                if (value.user != null) {
                                  print('STATUS Success : ${value.user}');
                                  print(
                                      'STATUS Success : ${value.user.getIdToken()}');
                                  String _usernameFromAPI = (context
                                          .read<UserCubit>()
                                          .state as UserLoaded)
                                      .user
                                      .name;

                                  setState(() {
                                    _isLoading = false;
                                  });

                                  FirebaseServices.registerFirestore(
                                      _userId,
                                      value.user.uid,
                                      _phoneNumber,
                                      _usernameFromAPI);
                                  Get.off(CreateProfilePage(),
                                      arguments: [_userId, _phoneNumber]);
                                }
                              });
                            } catch (e) {
                              print('STATUS invalid : $e');
                              showSnackbar('Gagal!', 'Kode OTP salah');
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        },
                        text: 'Verifikasi',
                        color: mainColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _verifyPhone() {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // --------- Auto Login -------- //
          print('FirebaseAuth Complete: $credential');
          FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            _isLoading = false;
            if (value.user != null) {
              String usernameFromAPI =
                  (context.bloc<UserCubit>().state as UserLoaded).user.name;

              FirebaseServices.registerFirestore(
                  _userId, value.user.uid, _phoneNumber, usernameFromAPI);
              Get.off(CreateProfilePage(), arguments: [_userId, _phoneNumber]);
            }
          });
        },
        verificationFailed: (FirebaseException e) {
          setState(() {
            _isLoading = false;
          });
          print('FirebaseAuth failed: ${e.message}');
          print(e.message);
        },
        codeSent: (String verificationID, int resendToken) {
          print('FirebaseAuth codeSent: $verificationID');
          setState(() {
            _verificationCode = verificationID;
            _isLoading = false;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          _isLoading = false;
          print('FirebaseAuth retrievalTimeout: $verificationID');
          setState(() {
            _verificationCode = verificationID;
            _isLoading = false;
          });
        },
        timeout: Duration(seconds: 120));
  }
}
