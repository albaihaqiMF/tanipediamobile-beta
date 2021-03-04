part of '../../pages.dart';

class CreateProfilePage2 extends StatefulWidget {
  @override
  _CreateProfilePage2State createState() => _CreateProfilePage2State();
}

class _CreateProfilePage2State extends State<CreateProfilePage2> {
  String _apiToken;
  int _idProfile;
  _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _apiToken = prefs.getString(KeySharedPreference.apiToken);
      _idProfile = prefs.getInt(KeySharedPreference.idProfile);
    });
  }

  bool _isUpdate = Get.arguments[0];
  int _userId = Get.arguments[1];
  String _name = Get.arguments[2];
  String _noTelp = Get.arguments[3];
  String _tglLahir = Get.arguments[4];
  int _gender = Get.arguments[5];
  int _golDarah = Get.arguments[6];
  int _agama = Get.arguments[7];
  int _suku = Get.arguments[8];
  int _pendidikan = Get.arguments[9];
  int _pekerjaan = Get.arguments[10];

  TextEditingController _nikController = TextEditingController();
  TextEditingController _kkController = TextEditingController();

  _isGetProfile() async {
    final data = (context.read<ProfileCubit>().state as ProfileLoaded);
    _nikController.text = data.profile.nik;
    _kkController.text = data.profile.kk;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (_isUpdate) {
      _isGetProfile();
    }
    _getToken();
    print('Data ID User : $_userId');
    print('Data Nama : $_name');
    print('Data No.Telp : $_noTelp');
    print('Data Tgl Lahir : $_tglLahir');
    print('Data Gender : $_gender');
    print('Data Darah : $_golDarah');
    print('Data Agama : $_agama');
    print('Data Suku : $_suku');
    print('Data Pendidikan : $_pendidikan');
    print('Data Pekerjaan : $_pekerjaan');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text((_isUpdate) ? 'Ubah Data Pribadi' : 'Data Pribadi',
              style: mainFontBoldStyle1),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded, color: mainColor),
                onPressed: () => Get.back()),
          ),
        ),
      ),
      body: KeyboardDismisser(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(defaultMargin),
          child: ListView(
            children: [
              TextField(
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  labelText: 'Nomor KTP (NIK)',
                  labelStyle: greyFontStyle,
                  hintText: 'Masukkan Nomor KTP (NIK)',
                  hintStyle: greyFontStyle,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                ),
                controller: _nikController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  labelText: 'Nomor KK',
                  labelStyle: greyFontStyle,
                  hintText: 'Masukkan Nomor KK',
                  hintStyle: greyFontStyle,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                ),
                controller: _kkController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  margin: EdgeInsets.only(bottom: defaultMargin),
                  child: CustomButton(
                      onPress: () async {
                        if (validationField()) {
                          if (_isUpdate) {
                            onUpdateProfile();
                          } else {
                            Get.toNamed(AppRoutes.CREATE_PROFILE_PAGE3,
                                arguments: [
                                  false,
                                  _userId,
                                  _name,
                                  _noTelp,
                                  _tglLahir,
                                  _gender,
                                  _golDarah,
                                  _agama,
                                  _suku,
                                  _pendidikan,
                                  _pekerjaan,
                                  _nikController.text,
                                  _kkController.text,
                                ]);
                          }
                        } else {
                          showSnackbar(
                              'Terjadi Kesalahan', 'Semua kolom harus diisi');
                        }
                      },
                      text: 'Selanjutnya',
                      color: mainColor))
            ],
          ),
        ),
      ),
    );
  }

  onUpdateProfile() async {
    showProgressDialog(context, 'Mohon tunggu...');
    await context.read<UpdateProfileCubit>().updateProfile(
        apiToken: _apiToken,
        idUser: _userId,
        idProfile: _idProfile,
        nama: _name,
        telp: _noTelp,
        nik: _nikController.text,
        kk: _kkController.text,
        tglLahir: _tglLahir,
        gender: _gender.toString(),
        golDarah: _golDarah.toString(),
        suku: _suku.toString(),
        agama: _agama.toString(),
        pendidikan: _pendidikan.toString(),
        pekerjaan: _pekerjaan.toString());

    UpdateProfileState state = context.read<UpdateProfileCubit>().state;
    if (state is UpdateProfileLoaded) {
      context.read<UpdateUserCubit>().updateUser(_apiToken, _userId, _noTelp, idProfile: _idProfile);
      await context.read<ProfileCubit>().getProfile(_apiToken, _idProfile);
      dismissProgressDialog(context);
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => SuccessDialog(
                title: 'Sukses',
                description: 'Anda berhasil mengupdate biodata',
                onPress: () => Get.offNamedUntil(
                    AppRoutes.BIODATA, ModalRoute.withName(AppRoutes.MAIN)),
              ));
    } else if (state is UpdateProfileFailed) {
      var message = state.message.toString();
      showSnackbar('Update biodata gagal!', message);
      dismissProgressDialog(context);
    }
  }

  bool validationField() {
    if (_userId != null &&
        _name != null &&
        _noTelp != null &&
        _tglLahir != null &&
        _gender != null &&
        _golDarah != null &&
        _agama != null &&
        _suku != null &&
        _pendidikan != null &&
        _pekerjaan != null &&
        _kkController.text.isNotEmpty &&
        _nikController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _nikController.dispose();
    _kkController.dispose();
    super.dispose();
  }
}
