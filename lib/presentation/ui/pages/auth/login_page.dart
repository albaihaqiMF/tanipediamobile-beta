part of '../pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _errorNameField = false;
  bool _errorPasswordField = false;

  bool _isHiddenPassword = true;
  void _toggleVisibility() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      backgroundColor: Colors.white,
      body: KeyboardDismisser(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 7),
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: AssetImage('assets/logo_app.png'))),
              ),
              Container(
                margin: EdgeInsets.only(top: 9, bottom: 36),
                width: 199,
                height: 30,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/text_app.png'))),
              ),
              TextField(
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  labelText: 'Username',
                  hintText: 'Masukkan Username',
                  hintStyle: greyFontStyle,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
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
                  errorText: _errorNameField ? 'Username tidak boleh kosong' : null,
                  prefixIcon: Icon(Icons.person),
                ),
                style: blackFontStyle3,
                keyboardType: TextInputType.name,
                controller: _nameController,
              ),
              SizedBox(height: 20),
              TextField(
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  labelText: 'Password',
                  hintText: 'Masukkan Password',
                  hintStyle: greyFontStyle,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
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
                  suffixIcon: IconButton(
                      icon: Icon(Icons.visibility_off),
                      onPressed: _toggleVisibility),
                ),
                obscureText: _isHiddenPassword,
                style: blackFontStyle3,
                controller: _passwordController,
              ),
              SizedBox(height: 20),
              Container(
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                child: (_isLoading)
                    ? loadingIndicator
                    : CustomButton(
                        onPress: () => login(),
                        text: 'Masuk',
                        color: mainColor),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum Punya Akun ? ", style: greyFontStyle),
                        InkWell(
                            splashColor: greyColor,
                            onTap: () => Get.toNamed(AppRoutes.REGISTER),
                            child: Text("Daftar",
                                style: TextStyle(color: mainColor)))
                      ])),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: Align(
                    alignment: Alignment.bottomCenter, child: textVersiApp),
              )
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    setState(() {
      _nameController.text.isEmpty
          ? _errorNameField = true
          : _errorNameField = false;
      _passwordController.text.isNotEmpty
          ? _errorPasswordField = false
          : _errorPasswordField = true;
    });

    if (!_errorNameField && !_errorPasswordField) {
      _isLoading = true;
      await context.read<LoginCubit>().login(_nameController.text.trim(), _passwordController.text.trim());
      LoginState state = context.read<LoginCubit>().state;
      try {
        if (state is LoginLoaded) {
          String apiToken = state.user.apiToken;
          int idProfile = state.user.idProfile;
          var idUser = state.user.id;
          var noTelp = state.user.telp;
          var username = state.user.name;
          saveData(apiToken, idUser, idProfile, noTelp, username, _passwordController.text);
          setState(() {
            _isLoading = false;
          });
          // Get.offAllNamed(AppRoutes.MAIN);
          Get.toNamed(AppRoutes.OTP, arguments: [idUser, username, noTelp]);
        } else if (state is LoginFailed) {
          var message = state.message.toString();
          showSnackbar('Terjadi kesalahan!', message);
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        print('Login Page Exception : ${e.toString()}');
        showSnackbar('Terjadi kesalahan!', e.toString());
      }
    }
  }

  void saveData(String apiToken, int idUser, int idProfile, String phoneNumber, String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KeySharedPreference.apiToken, apiToken);
    await prefs.setInt(KeySharedPreference.idUser, idUser);
    await prefs.setInt(KeySharedPreference.idProfile, idProfile);
    await prefs.setString(KeySharedPreference.phoneNumber, phoneNumber);
    await prefs.setString(KeySharedPreference.name, username);
    await prefs.setString(KeySharedPreference.password, password);
  }

  // Future<void> getData(String apiToken, int idProfile) async {
  //   await context.read<ProfileCubit>().getProfile(apiToken, idProfile);
  // }
}
