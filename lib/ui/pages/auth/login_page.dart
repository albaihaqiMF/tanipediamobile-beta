part of '../pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  bool _isLoading = false;
  bool _errorNameField = false;
  bool _errorPhoneField = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: ListView(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
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
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                hintText: 'Masukkan Nama',
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
                errorText: _errorNameField ? 'Nama tidak boleh kosong' : null,
              ),
              style: blackFontStyle3,
              keyboardType: TextInputType.name,
              controller: _nameController,
            ),
            SizedBox(height: 20),
            TextField(
              style: blackFontStyle3,
              decoration: InputDecoration(
                  hintText: 'Masukkan Telepon',
                  contentPadding: EdgeInsets.all(16),
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
                  errorText:
                      _errorPhoneField ? 'No.Telepon tidak boleh kosong' : null,
                  counterText: '',
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
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
              child: (_isLoading)
                  ? loadingIndicator
                  : CustomButton(
                      onPress: () => login(), text: 'Masuk', color: mainColor),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Belum Punya Akun ? ", style: greyFontStyle),
                  InkWell(
                      splashColor: greyColor,
                      onTap: () => Get.toNamed(AppRoutes.REGISTER),
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
      ),
    );
  }

  void login() async {
    setState(() {
      _nameController.text.isEmpty
          ? _errorNameField = true
          : _errorNameField = false;
      _phoneController.text.isNotEmpty &&
              AppValidator.phoneNumberValidator('+62${_phoneController.text}')
          ? _errorPhoneField = false
          : _errorPhoneField = true;
    });

    if (!_errorNameField && !_errorPhoneField) {
      _isLoading = true;
      await context
          .read<LoginCubit>()
          .login(_nameController.text, _phoneController.text);
      LoginState state = context.read<LoginCubit>().state;
      try {
        if (state is LoginLoaded) {
          var name = state.user.name;
          var apiToken = state.user.apiToken;
          saveData(apiToken, name);
          await context.read<ProfileCubit>().getProfile('246');
          context.read<GetListPupukCubit>().getListPupuk();
          context.read<GetPanenCubit>().getListPanen();
          setState(() {
            _isLoading = false;
          });
          Get.offAllNamed(AppRoutes.MAIN);
          // Get.offAllNamed(AppRoutes.OTP,
          //     arguments: ['+62${_phoneController.text}', userId]);
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

  void saveData(String apiToken, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KeySharedPreference.apiToken, apiToken);
    await prefs.setString(KeySharedPreference.name, name);
  }
}
