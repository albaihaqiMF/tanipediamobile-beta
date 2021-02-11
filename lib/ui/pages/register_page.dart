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
                          errorText: _errorNameField
                              ? 'Nama tidak boleh kosong'
                              : null,
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
                            counterText: '',
                            errorText: _errorPhoneField
                                ? 'No.Telepon tidak valid'
                                : null,
                            prefixText: '+62'),
                        maxLength: 15,
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                      ),
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
                                  await context.bloc<UserCubit>().register(
                                      _nameController.text,
                                      _phoneController.text);
                                  UserState state =
                                      context.bloc<UserCubit>().state;
                                  if (state is UserLoaded) {
                                    Get.offAll(AuthPage(),
                                        arguments:
                                            '+62${_phoneController.text}');
                                  } else {
                                    var message = (context
                                            .bloc<UserCubit>()
                                            .state as UserLoadingFailed)
                                        .message
                                        .toString();
                                    showSnackbar('Terjadi kesalahan!', message);
                                    _isLoading = false;
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
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
