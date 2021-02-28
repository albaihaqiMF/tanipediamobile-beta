part of '../pages.dart';

class CreateProfilePage2 extends StatefulWidget {
  @override
  _CreateProfilePage2State createState() => _CreateProfilePage2State();
}

class _CreateProfilePage2State extends State<CreateProfilePage2> {
  int _userId = Get.arguments[0];
  String _name = Get.arguments[1];
  String _noTelp = Get.arguments[2];
  String _tglLahir = Get.arguments[3];
  int _gender = Get.arguments[4];
  int _golDarah = Get.arguments[5];
  int _agama = Get.arguments[6];
  int _suku = Get.arguments[7];
  int _pendidikan = Get.arguments[8];
  int _pekerjaan = Get.arguments[9];

  TextEditingController _nikController = TextEditingController();
  TextEditingController _kkController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
          title: Text('Data Pribadi', style: mainFontBoldStyle1),
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
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(defaultMargin),
        child: ListView(
          children: [
            TextField(
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
                        Get.toNamed(AppRoutes.CREATE_PROFILE_PAGE3, arguments: [
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
    );
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
