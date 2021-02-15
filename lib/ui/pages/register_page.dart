part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;
  bool _errorNameField = false;
  bool _errorPhoneField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardDismisser(
        child: SingleChildScrollView(
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
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          hintText: 'Masukkan Nama',
                          hintStyle: greyFontStyle,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: (OutlineInputBorder(
                              borderSide: BorderSide(
                                color: mainColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10))),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorText: _errorNameField
                              ? 'Nama tidak boleh kosong'
                              : null,
                        ),
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: 'Masukkan Telepon',
                            contentPadding: EdgeInsets.all(16),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            enabledBorder: (OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: mainColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10))),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            counterText: '',
                            errorText: _errorPhoneField
                                ? 'No.Telepon tidak valid'
                                : null,
                            prefixText: '+62',
                            hintStyle: greyFontStyle),
                        maxLength: 15,
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 10, defaultMargin, 0),
                        child: (_isLoading)
                            ? loadingIndicator
                            : CustomButton(
                                onPress: () async {
                                  setState(() {
                                    _nameController.text.isEmpty
                                        ? _errorNameField = true
                                        : _errorNameField = false;
                                    _phoneController.text.isNotEmpty &&
                                            AppValidator.phoneNumberValidator(
                                                '+62${_phoneController.text}')
                                        ? _errorPhoneField = false
                                        : _errorPhoneField = true;
                                  });

                                  if (!_errorNameField && !_errorPhoneField) {
                                    _isLoading = true;
                                    await context.read<UserCubit>().register(
                                        _nameController.text,
                                        _phoneController.text);
                                    UserState state =
                                        context.read<UserCubit>().state;
                                    try {
                                      if (state is UserLoaded) {
                                        // saveSharedPreference();
                                        var userId = (context
                                                .read<UserCubit>()
                                                .state as UserLoaded)
                                            .user
                                            .id
                                            .toString();

                                        setState(() {
                                          _isLoading = false;
                                        });
                                        // Get.offAll(AuthPage(),
                                        //     arguments:
                                        //         '+62${_phoneController.text}');
                                        Get.offAll(AuthPage(), arguments: [
                                          '+62${_phoneController.text}',
                                          userId
                                        ]);
                                      } else {
                                        var message = (context
                                                .read<UserCubit>()
                                                .state as UserLoadingFailed)
                                            .message
                                            .toString();
                                        showSnackbar(
                                            'Terjadi kesalahan!', message);
                                        setState(() {
                                          _isLoading = false;
                                        });
                                      }
                                    } catch (e) {
                                      print(
                                          'Register Page Exception : ${e.toString()}');
                                      showSnackbar(
                                          'Terjadi kesalahan!', e.toString());
                                    }
                                  }
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
      ),
    );
  }

  // void saveSharedPreference() async {
  //   var userId =
  //       (context.watch<UserCubit>().state as UserLoaded).user.id.toString();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(KeySharedPreference.userId, userId);
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
