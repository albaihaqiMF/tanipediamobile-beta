part of '../pages.dart';

class CreateProfilePage3 extends StatefulWidget {
  @override
  _CreateProfilePage3State createState() => _CreateProfilePage3State();
}

class _CreateProfilePage3State extends State<CreateProfilePage3> {
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
  String _nik = Get.arguments[11];
  String _kk = Get.arguments[12];

  TextEditingController _alamatController = TextEditingController();
  TextEditingController _kodePosController = TextEditingController();
  TextEditingController _rtController = TextEditingController();
  TextEditingController _rwController = TextEditingController();
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

  // Update
  int _idProfileUpdate;
  String _apiToken;
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _apiToken = prefs.getString(KeySharedPreference.apiToken);
      _idProfileUpdate = prefs.getInt(KeySharedPreference.idProfile);
    });
  }

  _isGetProfile() async {
    final data = (context.read<GetProfileCubit>().state as GetProfileLoaded);
    _userId = data.profile.idUser;
    _alamatController.text = data.profile.alamat;
    if(data.profile.kodepos != 'null') {
      _kodePosController.text = data.profile.kodepos;
    }
    _rtController.text = data.profile.rt;
    _rwController.text = data.profile.rw;
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    getToken();
    if(_isUpdate) {
      _isGetProfile();
    }
    context.read<ProvinsiCubit>().getProvinsi();
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text((_isUpdate)? 'Ubah Alamat' :'Alamat', style: mainFontBoldStyle1),
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
          return KeyboardDismisser(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 10),
              child: ListView(
                children: [
                  TextField(
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      counterText: "",
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
                    maxLength: 4,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      counterText: "",
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
                    maxLength: 4,
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
                        if(selected.value!=null && int.tryParse(selected.value) != _selectedProvinsi) {
                          showProgressDialog(context, 'Mohon tunggu...');
                          print('SELECTED VALUE : ${selected.value}');
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
                              ProvinsiState state = context.read<ProvinsiCubit>().state;
                              if(state is ProvinsiLoaded){
                                List<Wilayah> listValueProvinsi = state.wilayah.toList();
                                _idProvinsi = listValueProvinsi[0].id;
                              }
                            } catch (e) {
                              print('Pick Provinsi Exception : ${e.toString()}');
                            }
                            context
                                .read<KabupatenCubit>()
                                .getKabupaten(_selectedProvinsi.toString());
                          }
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
                          dismissProgressDialog(context);
                          List<Wilayah> listKabupatenAPI = stateKabupaten.wilayah.toList();
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
                                if(selected.value!=null && int.tryParse(selected.value) != _selectedKabupaten) {
                                  showProgressDialog(context, 'Mohon tunggu...');
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
                                      await context.read<KabupatenCubit>().getKabupaten(_selectedProvinsi.toString(),kabupaten: _selectedKabupaten.toString());
                                      KabupatenState state = context.read<KabupatenCubit>().state;
                                      if(state is KabupatenLoaded){
                                        List<Wilayah> listValue = state.wilayah.toList();
                                        _idKabupaten = listValue[0].id;
                                      }
                                    } catch (e) {
                                      print(
                                          'Pick Kabupaten Exception : ${e.toString()}');
                                    }
                                    context.read<KecamatanCubit>().getKecamatan(
                                        _selectedProvinsi.toString(),
                                        _selectedKabupaten.toString());
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
                          dismissProgressDialog(context);
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
                                if(selected.value!=null && int.tryParse(selected.value) != _selectedKecamatan) {
                                  showProgressDialog(context, 'Mohon tunggu...');
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
                                      KecamatanState state = context.read<KecamatanCubit>().state;
                                      if(state is KecamatanLoaded){
                                        List<Wilayah> listValue = state.wilayah.toList();
                                        _idKecamatan = listValue[0].id;
                                      }
                                    } catch (e) {
                                      print(
                                          'Pick Kecamatan Exception : ${e.toString()}');
                                    }
                                    context.read<DesaCubit>().getDesa(
                                        _selectedProvinsi.toString(),
                                        _selectedKabupaten.toString(),
                                        _selectedKecamatan.toString());
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
                      dismissProgressDialog(context);
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
                            if(selected.value!=null && int.tryParse(selected.value) != _selectedDesa) {
                              showProgressDialog(context, 'Mohon tunggu...');
                              _selectedDesa = int.tryParse(selected.value);
                              if (_selectedDesa != null) {
                                //// Get id/value Kabupaten
                                try {
                                  await context.read<DesaCubit>().getDesa(
                                      _selectedProvinsi.toString(),
                                      _selectedKabupaten.toString(),
                                      _selectedKecamatan.toString(),
                                      desa: _selectedDesa.toString());
                                  DesaState stateDesa = context.read<DesaCubit>().state;
                                  if(stateDesa is DesaLoaded){
                                    List<Wilayah> listValue = stateDesa.wilayah.toList();
                                    _idDesa = listValue[0].id;
                                    dismissProgressDialog(context);
                                  }
                                } catch (e) {
                                  print(
                                      'Pick Kecamatan Exception : ${e.toString()}');
                                }
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
                  SizedBox(height: 10),
                  TextField(
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    decoration: InputDecoration(
                      counterText: "",
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
                    maxLength: 7,
                    keyboardType: TextInputType.number,
                    controller: _kodePosController,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    child: CustomButton(
                        onPress: () => (_isUpdate)? onUpdateData() : onPostData(),
                        text: 'Selesai',
                        color: mainColor),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: loadingIndicatorAnim,
          );
        }
      }),
    );
  }

  void onPostData() async {
    if (validationField()) {
      showProgressDialog(context, 'Mohon tunggu...');
      try {
        // Log In
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var username = prefs.getString(KeySharedPreference.name);
        var password = prefs.getString(KeySharedPreference.password);

        context.read<LoginCubit>().toInitial();
        await context.read<LoginCubit>().login(username, password);
        LoginState stateLogin = context.read<LoginCubit>().state;
        if (stateLogin is LoginLoaded) {
          var apiToken = stateLogin.user.apiToken;
          print('CREATE PROFILE 3 : apiToken = $apiToken');
          await context.read<CreateProfileCubit>().createProfile(
            token:apiToken,
            idUser:_userId,
            nama:_name,
            nik:_nik,
            kk:_kk,
            tglLahir:_tglLahir,
            kodepos:_kodePosController.text,
            alamat:_alamatController.text,
            rt:_rtController.text,
            rw:_rwController.text,
            gender:_gender.toString(),
            golDarah:_golDarah.toString(),
            suku:_suku.toString(),
            agama:_agama.toString(),
            pendidikan:_pendidikan.toString(),
            pekerjaan:_pekerjaan.toString(),
            telp:_noTelp,
            provinsi:_idProvinsi,
            kabupaten:_idKabupaten,
            kecamatan:_idKecamatan,
            desa:_idDesa,
          );

          //// Get Profile
          CreateProfileState stateProfile =context.read<CreateProfileCubit>().state;
          if (stateProfile is CreateProfileLoaded) {
            saveData(apiToken, stateProfile.profile.id);
            await getData(apiToken, stateProfile.profile.id, stateLogin.user.id, stateLogin.user.telp);
            dismissProgressDialog(context);
            Get.offAllNamed(AppRoutes.MAIN);
          } else if (stateProfile is CreateProfileLoadingFailed) {
            dismissProgressDialog(context);
            showSnackbar('Terjadi Kesalahan', '${stateProfile.message}');
          }
        } else if (stateLogin is LoginFailed) {
          dismissProgressDialog(context);
          showSnackbar('Terjadi kesalahan!', '${stateLogin.message}');
        }
      } catch (e) {
        dismissProgressDialog(context);
        print('Exception : ${e.toString()}');
        showSnackbar('Terjadi Kesalahan', '${e.toString()}');
      }
    } else {
      dismissProgressDialog(context);
      showSnackbar('Terjadi Kesalahan', 'Semua kolom harus diisi');
    }
  }

  void onUpdateData() async{
    if (validationField()) {
      showProgressDialog(context, 'Mohon tunggu...');
      await context.read<UpdateProfileCubit>().updateProfile(
        apiToken: _apiToken,
        idUser: _userId,
        idProfile: _idProfileUpdate,
        nama: _name,
        telp: _noTelp,
        nik: _nik,
        kk: _kk,
        tglLahir: _tglLahir,
        gender: _gender.toString(),
        golDarah: _golDarah.toString(),
        suku: _suku.toString(),
        agama: _agama.toString(),
        pendidikan: _pendidikan.toString(),
        pekerjaan: _pekerjaan.toString(),
        alamat: _alamatController.text,
        kodepos: _kodePosController.text,
        rt: _rtController.text,
        rw: _rwController.text,
        desa: _idDesa,
        kecamatan: _idKecamatan,
        kabupaten: _idKabupaten,
        provinsi: _idProvinsi,
      );

      UpdateProfileState stateUpdateProfile = context.read<UpdateProfileCubit>().state;
      if (stateUpdateProfile is UpdateProfileLoaded) {
        await context.read<GetProfileCubit>().getProfile(_apiToken, stateUpdateProfile.profile.id);
        dismissProgressDialog(context);
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => SuccessDialog(
              title: 'Sukses',
              description: 'Anda berhasil mengubah Data Diri',
              onPress: () => Get.offNamedUntil(
                  AppRoutes.BIODATA, ModalRoute.withName(AppRoutes.MAIN)),
            ));
      } else if (stateUpdateProfile is UpdateProfileFailed) {
        var message = stateUpdateProfile.message.toString();
        showSnackbar('Update alamat gagal!', message);
        dismissProgressDialog(context);
      }
    } else {
      dismissProgressDialog(context);
      showSnackbar('Terjadi Kesalahan', 'Semua kolom harus diisi');
    }
  }

  void saveData(String apiToken, int idProfile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KeySharedPreference.apiToken, apiToken);
    await prefs.setInt(KeySharedPreference.idProfile, idProfile);
  }

  Future<void> getData(String apiToken, int idProfile, int idUser, String noTelp) async {
    await context.read<GetProfileCubit>().getProfile(apiToken,idProfile);
    context.read<UpdateUserCubit>().updateUser(apiToken, idUser, noTelp, idProfile: idProfile);
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
        _selectedDesa != null) {
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
