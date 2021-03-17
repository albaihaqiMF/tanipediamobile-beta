part of '../pages.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _apiToken;
  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _apiToken = prefs.getString(KeySharedPreference.apiToken);
    });
  }

  String _verificationCode;
  int _userId = Get.arguments[0];
  String _username = Get.arguments[1];
  String _phoneNumber = Get.arguments[2];
  bool _isLoading = false;
  bool _errorField = false;

  TextEditingController _otpController = TextEditingController();

  StreamController<ErrorAnimationType> errorOTPController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _getToken();
    errorOTPController = StreamController<ErrorAnimationType>();
    print('AUTH PAGE : phone: $_phoneNumber');
    _verifyPhone();
  }

  @override
  void dispose() {
    errorOTPController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
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
                    Text('Verifikasi nomor telepon',
                        style: blackFontBoldStyle1),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        'Kode telah dikirimkan ke nomor $_phoneNumber via SMS',
                        textAlign: TextAlign.center,
                        style: blackFontStyle2,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(30),
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //       hintText: 'OTP Code',
                    //       errorText:
                    //           _errorField ? 'Nama tidak boleh kosong' : null,
                    //     ),
                    //     maxLength: 6,
                    //     keyboardType: TextInputType.number,
                    //     controller: _otpController,
                    //   ),
                    // ),

                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 40),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v.length < 6) {
                                return "Kode OTP tidak boleh kosong..";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.underline,
                              fieldHeight: 60,
                              fieldWidth: 30,
                              inactiveFillColor: Colors.white,
                              selectedFillColor: Colors.white,
                              activeFillColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            textStyle: TextStyle(fontSize: 20, height: 1.6),
                            enableActiveFill: true,
                            errorAnimationController: errorOTPController,
                            controller: _otpController,
                            keyboardType: TextInputType.number,
                            onCompleted: (v) {
                              print("Completed");
                              print("OTP Field : ${_otpController.text}");
                            },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                // currentText = value;
                                // print('CurrentValue : $currentText');
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              return true;
                            },
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: (_isLoading)
                      ? loadingIndicator
                      : CustomButton(
                          onPress: ()=> _sendOTP(),
                          text: 'Verifikasi',
                          color: mainColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendOTP() async {
    if (_otpController.text.isEmpty) {
      formKey.currentState.validate();
      errorOTPController.add(ErrorAnimationType.shake);
      showSnackbar('Gagal!', 'Kode OTP tidak boleh kosong.');
      setState(() {
        _errorField = true;
      });
    } else {
      _errorField = false;
    }

    setState(() {
      if (_otpController.text.isEmpty) {
        formKey.currentState.validate();
        _errorField = true;
        errorOTPController.add(ErrorAnimationType.shake);
        showSnackbar('Gagal!', 'Kode OTP tidak boleh kosong.');
      } else {
        _errorField = false;
      }
    });
    if (_errorField == false) {
      _isLoading = true;
      try {
        await FirebaseAuth.instance
            .signInWithCredential(PhoneAuthProvider.credential(
                verificationId: _verificationCode,
                smsCode: _otpController.text))
            .then((value) async {
          if (value.user != null) {

            // FirebaseServices.registerFirestore(_userId.toString(), value.user.uid, _phoneNumber, _username);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            int _idProfile = prefs.getInt(KeySharedPreference.idProfile);
            print('OTP_PAGE : idProfil = $_idProfile');
            if(_idProfile != null) {
              context.read<LoginCubit>().toInitial();
              await context.read<GetProfileCubit>().getProfile(_apiToken, _idProfile);
              setState(() {_isLoading = false;});
              Get.offAllNamed(AppRoutes.MAIN);
            } else {
              setState(() {_isLoading = false;});
              Get.offNamed(AppRoutes.CREATE_PROFILE_PAGE1,
                  arguments: [false, _userId, _phoneNumber]);
            }
          }
        });
      } catch (e) {
        formKey.currentState.validate();
        errorOTPController.add(ErrorAnimationType.shake);
        print('STATUS invalid : $e');
        showSnackbar('Gagal!', 'Kode OTP salah');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  _verifyPhone() {
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          // --------- Auto Auth -------- //
          print('FirebaseAuth Complete: $credential');
          FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
            _isLoading = false;
            if (value.user != null) {
              // FirebaseServices.registerFirestore(_userId.toString(), value.user.uid, _phoneNumber, _username);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              int _idProfile = prefs.getInt(KeySharedPreference.idProfile);
              print('AUTH PAGE ID PROFILE : $_idProfile');
              print('AUTH PAGE ID PROFILE : $_apiToken');
              if(_idProfile != null) {
                  context.read<LoginCubit>().toInitial();
                  await context.read<GetProfileCubit>().getProfile(_apiToken, _idProfile);
                Get.offAllNamed(AppRoutes.MAIN);
              } else {
                Get.offNamed(AppRoutes.CREATE_PROFILE_PAGE1,
                    arguments: [false, _userId, _phoneNumber]);
              }
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
