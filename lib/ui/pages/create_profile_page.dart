part of 'pages.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  int _userId = int.tryParse(Get.arguments[0]);
  String _noTelp = Get.arguments[1];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _noTelpController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();

  bool _isLoading = false;
  bool _errorNameField = false;
  bool _errorNoTelpField = false;
  bool _errorTglLahirField = false;
  // RadioButton
  int _selectedGender;
  int _selectedBlood;
  // Dialog
  int _selectedReligion;
  int _selectedEthnic;
  int _selectedEducation;
  int _selectedProfession;

  selectedGenders(int value) {
    setState(() {
      _selectedGender = value;
    });
  }

  selectedBloods(int value) {
    setState(() {
      _selectedBlood = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _noTelpController.text = _noTelp;
    // _selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Data Diri', style: mainFontBoldStyle1),
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
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                labelStyle: greyFontStyle,
                hintText: 'Masukkan Nama',
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
                // errorText: _errorNameField ? 'Kolom tidak boleh kosong' : null,
              ),
              controller: _nameController,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                labelStyle: greyFontStyle,
                hintText: 'Masukkan Nomor Telepon',
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
                errorText:
                    _errorNoTelpField ? 'Kolom tidak boleh kosong' : null,
              ),
              keyboardType: TextInputType.number,
              controller: _noTelpController,
            ),
            SizedBox(height: 10),
            TextField(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime(1990),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now())
                    .then((date) {
                  var formattedDate = DateFormat('MM-dd-y').format(date);
                  setState(() {
                    if (date == null) {
                      _tglLahirController.text = "Masukan Tanggal Lahir";
                    } else {
                      _tglLahirController.text = formattedDate;
                    }
                  });
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Masukkan Tanggal Lahir',
                hintStyle: greyFontStyle,
                suffixIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
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
                // errorText:
                //     _errorTglLahirField ? 'Kolom tidak boleh kosong' : null,
              ),
              controller: _tglLahirController,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                        padding: EdgeInsets.all(4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1000101,
                                groupValue: _selectedGender,
                                activeColor: mainColor,
                                onChanged: (val) {
                                  selectedGenders(val);
                                  print('Selected Gender : $_selectedGender');
                                },
                              ),
                              Text('Laki-laki')
                            ])),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                        padding: EdgeInsets.all(4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1000102,
                                groupValue: _selectedGender,
                                activeColor: mainColor,
                                onChanged: (val) {
                                  selectedGenders(val);
                                  print('Selected Gender : $_selectedGender');
                                },
                              ),
                              Text('Perempuan')
                            ])),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text('Golongan Darah', style: blackFontBoldStyle3),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1000401,
                                groupValue: _selectedBlood,
                                activeColor: mainColor,
                                onChanged: (val) {
                                  selectedBloods(val);
                                  print('Selected Blood : $_selectedBlood');
                                },
                              ),
                              Transform.translate(
                                  offset: const Offset(-8.0, 0.0),
                                  child: Text("A")),
                            ])),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1000402,
                                groupValue: _selectedBlood,
                                activeColor: mainColor,
                                onChanged: (val) {
                                  selectedBloods(val);
                                  print('Selected Blood : $_selectedBlood');
                                },
                              ),
                              Transform.translate(
                                  offset: const Offset(-8.0, 0.0),
                                  child: Text("B")),
                            ])),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1000403,
                                groupValue: _selectedBlood,
                                activeColor: mainColor,
                                onChanged: (val) {
                                  selectedBloods(val);
                                  print('Selected Blood : $_selectedBlood');
                                },
                              ),
                              Transform.translate(
                                  offset: const Offset(-8.0, 0.0),
                                  child: Text("AB")),
                            ])),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: mainColor,
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(children: [
                          Radio(
                            value: 1000404,
                            groupValue: _selectedBlood,
                            activeColor: mainColor,
                            onChanged: (val) {
                              selectedBloods(val);
                              print('Selected Blood : $_selectedBlood');
                            },
                          ),
                          Transform.translate(
                              offset: const Offset(-8.0, 0.0),
                              child: Text("O")),
                        ])),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: mainColor, width: 2)),
              child: SmartSelect<String>.single(
                choiceStyle: S2ChoiceStyle(accentColor: Colors.red),
                title: 'Agama',
                modalHeaderStyle: S2ModalHeaderStyle(
                    backgroundColor: mainColor, textStyle: whiteFontBoldStyle3),
                modalStyle: S2ModalStyle(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                modalType: S2ModalType.popupDialog,
                value: _selectedReligion.toString(),
                choiceItems: LocalData.agama,
                onChange: (selected) =>
                    _selectedReligion = int.tryParse(selected.value),
                tileBuilder: (context, state) {
                  return ListTile(
                    title: Text(state.title,
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    subtitle: Text(
                      (state.valueTitle != null)
                          ? state.valueTitle.toString()
                          : 'Pilih agama',
                      style: (state.valueTitle != null)
                          ? blackFontBoldStyle4
                          : greyFontStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    onTap: state.showModal,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: mainColor, width: 2)),
              child: SmartSelect<String>.single(
                choiceStyle: S2ChoiceStyle(accentColor: Colors.red),
                title: 'Suku',
                modalHeaderStyle: S2ModalHeaderStyle(
                    backgroundColor: mainColor, textStyle: whiteFontBoldStyle3),
                modalStyle: S2ModalStyle(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                modalType: S2ModalType.popupDialog,
                value: _selectedEthnic.toString(),
                choiceItems: LocalData.suku,
                onChange: (selected) =>
                    _selectedEthnic = int.tryParse(selected.value),
                tileBuilder: (context, state) {
                  return ListTile(
                    title: Text(state.title,
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    subtitle: Text(
                      (state.valueTitle != null)
                          ? state.valueTitle.toString()
                          : 'Pilih suku',
                      style: (state.valueTitle != null)
                          ? blackFontBoldStyle4
                          : greyFontStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    onTap: state.showModal,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: mainColor, width: 2)),
              child: SmartSelect<String>.single(
                choiceStyle: S2ChoiceStyle(accentColor: Colors.red),
                title: 'Pendidikan Terakhir',
                modalHeaderStyle: S2ModalHeaderStyle(
                    backgroundColor: mainColor, textStyle: whiteFontBoldStyle3),
                modalStyle: S2ModalStyle(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                modalType: S2ModalType.popupDialog,
                value: _selectedEducation.toString(),
                choiceItems: LocalData.pendidikan,
                onChange: (selected) =>
                    _selectedEducation = int.tryParse(selected.value),
                tileBuilder: (context, state) {
                  return ListTile(
                    title: Text(state.title,
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    subtitle: Text(
                      (state.valueTitle != null)
                          ? state.valueTitle.toString()
                          : 'Pilih pendidikan terakhir',
                      style: (state.valueTitle != null)
                          ? blackFontBoldStyle4
                          : greyFontStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    onTap: state.showModal,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: mainColor, width: 2)),
              child: SmartSelect<String>.single(
                choiceStyle: S2ChoiceStyle(accentColor: Colors.red),
                title: 'Pekerjaan',
                modalHeaderStyle: S2ModalHeaderStyle(
                    backgroundColor: mainColor, textStyle: whiteFontBoldStyle3),
                modalStyle: S2ModalStyle(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                modalType: S2ModalType.popupDialog,
                value: _selectedProfession.toString(),
                choiceItems: LocalData.pekerjaan,
                onChange: (selected) =>
                    _selectedProfession = int.tryParse(selected.value),
                tileBuilder: (context, state) {
                  return ListTile(
                    title: Text(state.title,
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                    subtitle: Text(
                      (state.valueTitle != null)
                          ? state.valueTitle.toString()
                          : 'Pilih pekerjaan',
                      style: (state.valueTitle != null)
                          ? blackFontBoldStyle4
                          : greyFontStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    onTap: state.showModal,
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.only(bottom: defaultMargin),
              child: (_isLoading)
                  ? loadingIndicator
                  : CustomButton(
                      onPress: () async {
                        if (!validationField()) {
                          print('Data ID User : $_userId');
                          print('Data Nama : ${_nameController.text}');
                          print('Data No.Telp : ${_noTelpController.text}');
                          print('Data Tgl Lahir : ${_tglLahirController.text}');
                          print('Data Gender : $_selectedGender');
                          print('Data Darah : $_selectedBlood');
                          print('Data Agama : $_selectedReligion');
                          print('Data Suku : $_selectedEthnic');
                          print('Data Pendidikan : $_selectedEducation');
                          print('Data Pekerjaan : $_selectedProfession');

                          Get.toNamed(AppRoutes.CREATE_PROFILE_PAGE2,
                              arguments: [
                                _userId,
                                _nameController.text,
                                _noTelpController.text,
                                _tglLahirController.text,
                                _selectedGender,
                                _selectedBlood,
                                _selectedReligion,
                                _selectedEthnic,
                                _selectedEducation,
                                _selectedProfession
                              ]);

                          // Get.toNamed(AppRoutes.TEST, arguments: [
                          //   1141,
                          //   'Julius',
                          //   // nik,
                          //   '1111',
                          //   // kk
                          //   '2222',
                          //   '01-01-1990',
                          //   //kodepos
                          //   '35122',
                          //   //alamat
                          //   'KebayoranLama',
                          //   //rt
                          //   '10',
                          //   //rw
                          //   '11',
                          //   //gender
                          //   '1000101',
                          //   // golDarah,
                          //   '1000402',
                          //   // suku,
                          //   // '1000501',
                          //   _selectedEthnic.toString(),
                          //   // agama,
                          //   '1000201',
                          //   // pendidikan,
                          //   // '1000301',

                          //   _selectedEducation.toString(),
                          //   _selectedProfession.toString(),
                          //   // pekerjaan,
                          //   // '1000601',
                          //   '+628985953469',
                          //   //provinsi
                          //   '18',
                          //   //kabupaten
                          //   '6',
                          //   //kec
                          //   '8',
                          //   //desa
                          //   '2001'
                          // ]);

                          // try {
                          //   await context
                          //       .bloc<CreateProfileCubit>()
                          //       .createProfile(
                          //           _userId,
                          //           _nameController.text,
                          //           _nikController.text,
                          //           _kkController.text,
                          //           _tglLahirController.text,
                          //           _kodePosController.text,
                          //           _rtController.text,
                          //           _rwController.text,
                          //           selectedGender.code,
                          //           selectedBlood.code,
                          //           selectedEthnic.code,
                          //           selectedReligion.code,
                          //           selectedEducation.code,
                          //           selectedProfession.code,
                          //           selectedCategory.code,
                          //           telp);
                          // } catch (e) {
                          // setState(() {
                          //   _isLoading = false;
                          // });
                          // print('Exception : ${e.toString()}');
                          // showSnackbar('Terjadi Kesalahan',
                          //     'Semua Kolom harus diisi.');
                          // }
                        } else {
                          showSnackbar(
                              'Terjadi Kesalahan', 'Semua kolom harus diisi');
                        }
                        // CreateProfileState state =
                        //     context.bloc<CreateProfileCubit>().state;

                        // if (state is CreateProfileLoaded) {
                        //   setState(() {
                        //     _isLoading = false;
                        //   });

                        //   var _idProfile = (context
                        //           .bloc<CreateProfileCubit>()
                        //           .state as CreateProfileLoaded)
                        //       .profile
                        //       .id;

                        //   SharedPreferences prefs =
                        //       await SharedPreferences.getInstance();
                        //   await prefs.setInt(KeySharedPreference.idProfile,
                        //       int.tryParse(_idProfile));

                        //   // Get Data Profile
                        //   await context
                        //       .bloc<ProfileCubit>()
                        //       .getProfile(_idProfile);

                        //   Get.offAll(ProfilePage(), arguments: _userId);
                        // } else if (state is CreateProfileLoadingFailed) {
                        //   var message = (context
                        //           .bloc<CreateProfileCubit>()
                        //           .state as CreateProfileLoadingFailed)
                        //       .message
                        //       .toString();
                        //   showSnackbar('Terjadi kesalahan!', message);
                        //   setState(() {
                        //     _isLoading = false;
                        //   });
                        // }
                      },
                      text: 'Selanjutnya',
                      color: mainColor),
            )
          ],
        ),
      ),
    );
  }

  bool validationField() {
    if (_userId != null &&
        _nameController.text.isNotEmpty &&
        _tglLahirController.text.isNotEmpty &&
        _noTelpController.text.isNotEmpty &&
        _selectedBlood != null &&
        _selectedEducation != null &&
        _selectedProfession != null &&
        _selectedEthnic != null &&
        _selectedReligion != null &&
        _selectedGender != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _tglLahirController.dispose();
    super.dispose();
  }
}
