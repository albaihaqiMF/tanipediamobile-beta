part of '../../pages.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _errorNameField = false;
  bool _errorPhoneField = false;
  bool _errorPasswordField = false;
  bool _isHiddenPassword = true;
  void _toggleVisibility(){
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
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
                        style: blackFontStyle3,
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(16),
                          hintText: 'Masukkan Password',
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
                          errorText: _errorPasswordField
                              ? 'Password tidak boleh kosong'
                              : null,
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon:IconButton(icon:Icon(Icons.visibility_off), onPressed:_toggleVisibility),
                        ),
                        obscureText: _isHiddenPassword,
                        style: blackFontStyle3,
                        controller: _passwordController,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        style: blackFontStyle3,
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
                            hintStyle: greyFontStyle,
                            prefixIcon: Container(
                                padding: EdgeInsets.fromLTRB(15, 11, 0, 11),
                                child: Text(
                                  '+62',
                                  style: blackFontStyle2,
                                ))),
                        maxLength: 15,
                        keyboardType: TextInputType.number,
                        controller: _phoneController,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            defaultMargin, 10, defaultMargin, 10),
                        child: (_isLoading)
                            ? Container(
                                margin: EdgeInsets.only(top: 10),
                                child: loadingIndicator)
                            : CustomButton(
                                onPress: () => register(),
                                text: 'DAFTAR',
                                color: mainColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Sudah punya akun? '),
                          InkWell(
                            onTap: () => Get.toNamed(AppRoutes.LOGIN),
                            child: Text(
                              'Masuk',
                              style: mainFontStyle3,
                            ),
                          )
                        ],
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

  void register() async {
    setState(() {
      _nameController.text.isEmpty
          ? _errorNameField = true
          : _errorNameField = false;
      _passwordController.text.isEmpty
          ? _errorPasswordField = true
          : _errorPasswordField = false;
      _phoneController.text.isNotEmpty &&
              AppValidator.phoneNumberValidator('+62${_phoneController.text}')
          ? _errorPhoneField = false
          : _errorPhoneField = true;
    });

    if (!_errorNameField && !_errorPasswordField && !_errorPhoneField) {
      _isLoading = true;
      await context
          .read<RegisterCubit>()
          .register(_nameController.text.trim(), _passwordController.text.trim());
      RegisterState state = context.read<RegisterCubit>().state;
      try {
        if (state is RegisterLoaded) {
          var userId = state.user.id.toString();
          saveSharedPreference(_nameController.text.trim(), _passwordController.text.trim());
          setState(() {
            _isLoading = false;
          });
          Get.offAllNamed(AppRoutes.OTP,
              arguments: ['+62${_phoneController.text}', userId]);
        } else if (state is RegisterFailed) {
          var message = state.message.toString();
          showSnackbar('Terjadi kesalahan!', message);
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        print('Register Page Exception : ${e.toString()}');
        showSnackbar('Terjadi kesalahan!', e.toString());
      }
    }
  }

  void saveSharedPreference(String name, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(KeySharedPreference.name, name);
  await prefs.setString(KeySharedPreference.password, password);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
