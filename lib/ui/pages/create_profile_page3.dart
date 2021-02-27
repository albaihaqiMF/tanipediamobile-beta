part of 'pages.dart';

class CreateProfilePage3 extends StatefulWidget {
  @override
  _CreateProfilePage3State createState() => _CreateProfilePage3State();
}

class _CreateProfilePage3State extends State<CreateProfilePage3> {
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
  String _nik = Get.arguments[10];
  String _kk = Get.arguments[11];

  TextEditingController _alamatController = TextEditingController();
  TextEditingController _rwController = TextEditingController();
  TextEditingController _rtController = TextEditingController();
  TextEditingController _kodePosController = TextEditingController();
  // Dialog
  int _selectedDesa;
  int _selectedKecamatan;
  int _selectedKabupaten;
  int _selectedProvinsi;
  // Data Post
  String _idDesa;
  String _idKecamatan;
  String _idKabupaten;
  String _idProvinsi;

  List<S2Choice<String>> listProvinsi = [];
  List<S2Choice<String>> listKabupaten = [];
  List<S2Choice<String>> listKecamatan = [];
  List<S2Choice<String>> listDesa = [];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    context.read<ProvinsiCubit>().toInitial();
    context.read<KabupatenCubit>().toInitial();
    context.read<KecamatanCubit>().toInitial();
    context.read<DesaCubit>().toInitial();
    _selectedProvinsi = null;
    _selectedKabupaten = null;
    _selectedKecamatan = null;
    _selectedDesa = null;
    listProvinsi.clear();
    listKabupaten.clear();
    listKecamatan.clear();
    listDesa.clear();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProvinsiCubit>().getProvinsi();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Alamat', style: mainFontBoldStyle1),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded, color: mainColor),
                onPressed: () {
                  Get.back();
                  context.read<ProvinsiCubit>().toInitial();
                }),
          ),
        ),
      ),
      body: BlocBuilder<ProvinsiCubit, ProvinsiState>(builder: (_, state) {
        if (state is ProvinsiLoaded) {
          //// Add List Provinsi
          List<Wilayah> listProvinsiAPI = state.wilayah.toList();
          for (int i = 0; i < listProvinsiAPI.length; i++) {
            listProvinsi.add(S2Choice<String>(
                value: listProvinsiAPI[i].provinsi,
                title: listProvinsiAPI[i].name));
          }
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    labelStyle: greyFontStyle,
                    hintText: 'Masukkan Alamat',
                    hintStyle: greyFontStyle,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                  controller: _alamatController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Kode Pos',
                    labelStyle: greyFontStyle,
                    hintText: 'Masukkan Kode Pos',
                    hintStyle: greyFontStyle,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                  keyboardType: TextInputType.number,
                  controller: _kodePosController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'RT',
                    labelStyle: greyFontStyle,
                    hintText: 'Masukkan RT',
                    hintStyle: greyFontStyle,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                  keyboardType: TextInputType.number,
                  controller: _rtController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'RW',
                    labelStyle: greyFontStyle,
                    hintText: 'Masukkan RW',
                    hintStyle: greyFontStyle,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                  keyboardType: TextInputType.number,
                  controller: _rwController,
                ),

                // Dropdown Provinsi
                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: mainColor, width: 2)),
                  child: SmartSelect<String>.single(
                    title: 'Provinsi',
                    modalHeaderStyle: S2ModalHeaderStyle(
                        backgroundColor: mainColor,
                        textStyle: whiteFontBoldStyle3),
                    modalStyle: S2ModalStyle(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    modalType: S2ModalType.popupDialog,
                    value: _selectedProvinsi.toString(),
                    choiceItems: listProvinsi,
                    onChange: (selected) async {
                      _selectedProvinsi = int.tryParse(selected.value);
                      _selectedKabupaten = null;
                      _selectedKecamatan = null;
                      _selectedDesa = null;
                      listKabupaten.clear();
                      listKecamatan.clear();
                      listDesa.clear();
                      context.read<KabupatenCubit>().toInitial();
                      context.read<KecamatanCubit>().toInitial();
                      context.read<DesaCubit>().toInitial();
                      if (_selectedProvinsi != null) {
                        //// Get id/value Provinsi
                        try {
                          await context
                              .read<ProvinsiCubit>()
                              .getProvinsi(provinsi: selected.value);
                          final data = (context.read<ProvinsiCubit>().state
                              as ProvinsiLoaded);
                          List<Wilayah> listValueProvinsi =
                              data.wilayah.toList();
                          _idProvinsi = listValueProvinsi[0].id;
                        } catch (e) {
                          print('Pick Provinsi Exception : ${e.toString()}');
                        }
                        context
                            .read<KabupatenCubit>()
                            .getKabupaten(_selectedProvinsi.toString());
                      }
                    },
                    tileBuilder: (context, state) {
                      return ListTile(
                        title: Text(state.title,
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        subtitle: Text(
                          (state.valueTitle != null)
                              ? state.valueTitle.toString()
                              : 'Pilih provinsi',
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
                //// Dropdown Kabupaten
                BlocBuilder<KabupatenCubit, KabupatenState>(
                    builder: (_, stateKabupaten) {
                  if (stateKabupaten is KabupatenLoaded) {
                    List<Wilayah> listKabupatenAPI =
                        stateKabupaten.wilayah.toList();

                    for (int i = 0; i < listKabupatenAPI.length; i++) {
                      listKabupaten.add(S2Choice<String>(
                          value: listKabupatenAPI[i].kabupaten,
                          title: listKabupatenAPI[i].name));
                    }

                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: mainColor, width: 2)),
                      child: SmartSelect<String>.single(
                        title: 'Kabupaten',
                        modalHeaderStyle: S2ModalHeaderStyle(
                            backgroundColor: mainColor,
                            textStyle: whiteFontBoldStyle3),
                        modalStyle: S2ModalStyle(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        choiceEmptyBuilder: (context, value) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                size: 150,
                                color: Colors.grey[500],
                              ),
                              Text('Woops', style: greyFontStyleSuperBig),
                              Text('Terjadi Kesalahan!',
                                  style: greyFontStyleVeryBig),
                              Text('Klik tombol dibawah ini',
                                  style: greyFontStyle),
                              SizedBox(height: 10),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.refresh_outlined,
                                    color: Colors.blue,
                                    size: 44,
                                  )),
                            ],
                          ),
                        ),
                        modalType: S2ModalType.popupDialog,
                        value: _selectedKabupaten.toString(),
                        choiceItems: listKabupaten,
                        onChange: (selected) async {
                          _selectedKabupaten = int.tryParse(selected.value);
                          _selectedKecamatan = null;
                          _selectedDesa = null;
                          listKecamatan.clear();
                          listDesa.clear();
                          context.read<KecamatanCubit>().toInitial();
                          context.read<DesaCubit>().toInitial();
                          if (_selectedKabupaten != null) {
                            //// Get id/value Kabupaten
                            try {
                              await context.read<KabupatenCubit>().getKabupaten(
                                  _selectedProvinsi.toString(),
                                  kabupaten: _selectedKabupaten.toString());
                              final data = (context.read<KabupatenCubit>().state
                                  as KabupatenLoaded);
                              List<Wilayah> listValue = data.wilayah.toList();
                              _idKabupaten = listValue[0].id;
                            } catch (e) {
                              print(
                                  'Pick Kabupaten Exception : ${e.toString()}');
                            }
                            context.read<KecamatanCubit>().getKecamatan(
                                _selectedProvinsi.toString(),
                                _selectedKabupaten.toString());
                          }
                        },
                        tileBuilder: (context, state) {
                          return ListTile(
                            title: Text(state.title,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            subtitle: Text(
                              (state.valueTitle != null)
                                  ? state.valueTitle.toString()
                                  : 'Pilih kabupaten',
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
                    );
                  } else {
                    return Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: BorderSide(color: Colors.grey, width: 2)),
                        child: SmartSelect<String>.single(
                          title: 'Kabupaten',
                          value: _selectedKabupaten.toString(),
                          choiceItems: listKabupaten,
                          onChange: (selected) =>
                              _selectedKabupaten = int.tryParse(selected.value),
                          tileBuilder: (context, state) {
                            return ListTile(
                              title: Text(state.title,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                              subtitle: Text(
                                'Pilih kabupaten',
                                style: greyFontStyle,
                              ),
                              trailing: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              ),
                              enabled: false,
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
                SizedBox(height: 10),
                // Dropdown Kecamatan
                BlocBuilder<KecamatanCubit, KecamatanState>(
                    builder: (_, stateKecamatan) {
                  if (stateKecamatan is KecamatanLoaded) {
                    List<Wilayah> listAPI = stateKecamatan.wilayah.toList();

                    for (int i = 0; i < listAPI.length; i++) {
                      listKecamatan.add(S2Choice<String>(
                          value: listAPI[i].kecamatan, title: listAPI[i].name));
                    }
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: mainColor, width: 2)),
                      child: SmartSelect<String>.single(
                        choiceStyle: S2ChoiceStyle(accentColor: Colors.red),
                        title: 'Kecamatan',
                        modalHeaderStyle: S2ModalHeaderStyle(
                            backgroundColor: mainColor,
                            textStyle: whiteFontBoldStyle3),
                        modalStyle: S2ModalStyle(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        modalType: S2ModalType.popupDialog,
                        value: _selectedKecamatan.toString(),
                        choiceItems: listKecamatan,
                        onChange: (selected) async {
                          _selectedKecamatan = int.tryParse(selected.value);
                          _selectedDesa = null;
                          listDesa.clear();
                          context.read<DesaCubit>().toInitial();
                          if (_selectedKecamatan != null) {
                            //// Get id/value Kabupaten
                            try {
                              await context.read<KecamatanCubit>().getKecamatan(
                                  _selectedProvinsi.toString(),
                                  _selectedKabupaten.toString(),
                                  kecamatan: _selectedKecamatan.toString());
                              final data = (context.read<KecamatanCubit>().state
                                  as KecamatanLoaded);
                              List<Wilayah> listValue = data.wilayah.toList();
                              _idKecamatan = listValue[0].id;
                            } catch (e) {
                              print(
                                  'Pick Kecamatan Exception : ${e.toString()}');
                            }
                            context.read<DesaCubit>().getDesa(
                                _selectedProvinsi.toString(),
                                _selectedKabupaten.toString(),
                                _selectedKecamatan.toString());
                          }
                        },
                        tileBuilder: (context, state) {
                          return ListTile(
                            title: Text(state.title,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            subtitle: Text(
                              (state.valueTitle != null)
                                  ? state.valueTitle.toString()
                                  : 'Pilih kecamatan',
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
                    );
                  } else {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.grey, width: 2)),
                      child: SmartSelect<String>.single(
                        title: 'Kecamatan',
                        value: _selectedKabupaten.toString(),
                        choiceItems: listKabupaten,
                        onChange: (selected) =>
                            _selectedKabupaten = int.tryParse(selected.value),
                        tileBuilder: (context, state) {
                          return ListTile(
                            title: Text(state.title,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            subtitle: Text(
                              'Pilih Kecamatan',
                              style: greyFontStyle,
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                            enabled: false,
                          );
                        },
                      ),
                    );
                  }
                }),
                SizedBox(height: 10),
                // Dropdown Desa
                BlocBuilder<DesaCubit, DesaState>(builder: (_, stateDesa) {
                  if (stateDesa is DesaLoaded) {
                    List<Wilayah> listAPI = stateDesa.wilayah.toList();
                    for (int i = 0; i < listAPI.length; i++) {
                      listDesa.add(S2Choice<String>(
                          value: listAPI[i].desa, title: listAPI[i].name));
                    }
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: mainColor, width: 2)),
                      child: SmartSelect<String>.single(
                        choiceStyle: S2ChoiceStyle(accentColor: Colors.red),
                        title: 'Desa',
                        modalHeaderStyle: S2ModalHeaderStyle(
                            backgroundColor: mainColor,
                            textStyle: whiteFontBoldStyle3),
                        modalStyle: S2ModalStyle(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        modalType: S2ModalType.popupDialog,
                        value: _selectedDesa.toString(),
                        choiceItems: listDesa,
                        onChange: (selected) async {
                          _selectedDesa = int.tryParse(selected.value);
                          if (_selectedDesa != null) {
                            //// Get id/value Kabupaten
                            try {
                              await context.read<DesaCubit>().getDesa(
                                  _selectedProvinsi.toString(),
                                  _selectedKabupaten.toString(),
                                  _selectedKecamatan.toString(),
                                  desa: _selectedDesa.toString());
                              final data = (context.read<DesaCubit>().state
                                  as DesaLoaded);
                              List<Wilayah> listValue = data.wilayah.toList();
                              _idDesa = listValue[0].id;
                            } catch (e) {
                              print(
                                  'Pick Kecamatan Exception : ${e.toString()}');
                            }
                          }
                        },
                        tileBuilder: (context, state) {
                          return ListTile(
                            title: Text(state.title,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            subtitle: Text(
                              (state.valueTitle != null)
                                  ? state.valueTitle.toString()
                                  : 'Pilih desa',
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
                    );
                  } else {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(color: Colors.grey, width: 2)),
                      child: SmartSelect<String>.single(
                        title: 'Desa',
                        value: _selectedKabupaten.toString(),
                        choiceItems: listKabupaten,
                        onChange: (selected) =>
                            _selectedKabupaten = int.tryParse(selected.value),
                        tileBuilder: (context, state) {
                          return ListTile(
                            title: Text(state.title,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            subtitle: Text(
                              'Pilih Desa',
                              style: greyFontStyle,
                            ),
                            trailing: const Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                            ),
                            enabled: false,
                          );
                        },
                      ),
                    );
                  }
                }),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  margin: EdgeInsets.only(bottom: defaultMargin),
                  child: (_isLoading)
                      ? loadingIndicator
                      : CustomButton(
                          onPress: () async {
                            if (validationField()) {
                              // _isLoading = true;
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                await context
                                    .read<CreateProfileCubit>()
                                    .createProfile(
                                        _userId,
                                        _name,
                                        _nik,
                                        _kk,
                                        _tglLahir,
                                        _kodePosController.text,
                                        _alamatController.text,
                                        _rtController.text,
                                        _rwController.text,
                                        _gender.toString(),
                                        _golDarah.toString(),
                                        _suku.toString(),
                                        _agama.toString(),
                                        _pendidikan.toString(),
                                        _pekerjaan.toString(),
                                        _noTelp,
                                        _idProvinsi,
                                        _idKabupaten,
                                        _idKecamatan,
                                        _idDesa);

                                //// Get Profile
                                CreateProfileState stateProfile =
                                    context.bloc<CreateProfileCubit>().state;

                                if (stateProfile is CreateProfileLoaded) {
                                  var _idProfile = (context
                                          .bloc<CreateProfileCubit>()
                                          .state as CreateProfileLoaded)
                                      .profile
                                      .id;

                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setInt(
                                      KeySharedPreference.idProfile,
                                      int.tryParse(_idProfile));
                                  //// Get Data Profile
                                  await context
                                      .bloc<ProfileCubit>()
                                      .getProfile(_idProfile);
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Get.offAllNamed(AppRoutes.PROFILE);
                                }
                              } catch (e) {
                                setState(() {
                                  _isLoading = false;
                                });
                                // context.read<ProvinsiCubit>().getProvinsi();
                                print('Exception : ${e.toString()}');
                                showSnackbar('Terjadi Kesalahan',
                                    'Semua Kolom harus diisi.');
                              }
                            } else {
                              setState(() {
                                _isLoading = false;
                              });
                              showSnackbar('Terjadi Kesalahan',
                                  'Semua kolom harus diisi');
                            }
                          },
                          text: 'Selesai',
                          color: mainColor),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: loadingIndicator,
          );
        }
      }),
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
        _kk != null &&
        _nik != null &&
        _rtController.text.isNotEmpty &&
        _rwController.text.isNotEmpty &&
        _alamatController.text.isNotEmpty &&
        _kodePosController.text.isNotEmpty &&
        _idProvinsi != null &&
        _idKabupaten != null &&
        _idKecamatan != null &&
        _idDesa != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _rtController.dispose();
    _rwController.dispose();
    _kodePosController.dispose();
    super.dispose();
  }
}
