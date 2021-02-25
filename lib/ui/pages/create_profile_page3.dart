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
  List<S2Choice<String>> listProvinsi = [];
  List<S2Choice<String>> listKabupaten = [];
  List<S2Choice<String>> listKecamatan = [];
  List<S2Choice<String>> listDesa = [];

  bool _isLoading = false;

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
    print('Data NIK : $_nik');
    print('Data No.KK : $_kk');
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProvinsiCubit>().getProvinsi();
    // (context.bloc<ProvinsiCubit>().state as ProvinsiLoaded);
    // List<Wilayah> listProvinsiAPI =
    //     (context.bloc<ProvinsiCubit>().state as ProvinsiLoaded)
    //         .wilayah
    //         .toList();
    // List<Wilayah> listProvinsiAPI = state.wilayah.toList();
    // for (int i = 0; i < listProvinsiAPI.length; i++) {
    //   listProvinsi.add(S2Choice<String>(
    //       value: listProvinsiAPI[i].provinsi, title: listProvinsiAPI[i].name));
    // }

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
          List<Wilayah> listProvinsiAPI = state.wilayah.toList();
          for (int i = 0; i < listProvinsiAPI.length; i++) {
            listProvinsi.add(S2Choice<String>(
                value: listProvinsiAPI[i].provinsi,
                title: listProvinsiAPI[i].name));
          }
          return Container(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
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
                    onChange: (selected) {
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
                // Dropdown Kabupaten
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
                        onChange: (selected) {
                          _selectedKabupaten = int.tryParse(selected.value);
                          _selectedKecamatan = null;
                          _selectedDesa = null;
                          listKecamatan.clear();
                          listDesa.clear();
                          context.read<KecamatanCubit>().toInitial();
                          context.read<DesaCubit>().toInitial();
                          if (_selectedKabupaten != null) {
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
                        onChange: (selected) {
                          _selectedKecamatan = int.tryParse(selected.value);
                          _selectedDesa = null;
                          listDesa.clear();
                          context.read<DesaCubit>().toInitial();
                          if (_selectedKecamatan != null) {
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
                    print('Daftar Desa : $listDesa');
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
                        onChange: (selected) =>
                            _selectedDesa = int.tryParse(selected.value),
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
                            if (!validationField()) {
                              // _isLoading = true;
                              // setState(() {
                              //   _isLoading = true;
                              // });
                              try {
                                // Dummy Data
                                // Success
                                // Get.toNamed(AppRoutes.TEST, arguments: [
                                // 1134,
                                // 'Julius',
                                // // nik,
                                // '1111',
                                // // kk
                                // '2222',
                                // '01-01-1990',
                                // //kodepos
                                // '35122',
                                // //alamat
                                // 'KebayoranLama',
                                // //rt
                                // '10',
                                // //rw
                                // '11',
                                // //gender
                                // '1000101',
                                // // golDarah,
                                // '1000402',
                                // // suku,
                                // '1000501',
                                // // agama,
                                // '1000201',
                                // // pendidikan,
                                // '1000301',
                                // // pekerjaan,
                                // '1000601',
                                // '+628985953469',
                                // //provinsi
                                // '18',
                                // //kabupaten
                                // '6',
                                // //kec
                                // '8',
                                // //desa
                                // '2001'
                                // ]);

                                // Direct to the Service
                                // Success
                                // ProfileServices.create(
                                //     1135,
                                //     'Julius',
                                //     '+628911231',
                                //     '01-01-1990',
                                //     '1000101',
                                //     '1000101',
                                //     '1000101',
                                //     '1000101',
                                //     '1000101',
                                //     '1000101',
                                //     '1111',
                                //     '1111',
                                //     'alamat',
                                //     '01',
                                //     '02',
                                //     '11234',
                                //     '18',
                                //     '6',
                                //     '8',
                                //     '201');

                                // ProfileServices.create(
                                //     // _userId,
                                //     // _name,
                                //     // _nik,
                                //     // _kk,
                                //     // _tglLahir,
                                //     // _kodePosController.text,
                                //     // _alamatController.text,
                                //     // _rtController.text,
                                //     // _rwController.text,
                                //     // _gender.toString(),
                                //     // _golDarah.toString(),
                                //     // _suku.toString(),
                                //     // _agama.toString(),
                                //     // _pendidikan.toString(),
                                //     // _pekerjaan.toString(),
                                //     // _noTelp,
                                //     // _selectedProvinsi.toString(),
                                //     // _selectedKabupaten.toString(),
                                //     // _selectedKecamatan.toString(),
                                //     // _selectedDesa.toString(),
                                //     1135,
                                //     'Julius',
                                //     // nik,
                                //     '1111',
                                //     // kk
                                //     '2222',
                                //     '01-01-1990',
                                //     //kodepos
                                //     '35122',
                                //     //alamat
                                //     'KebayoranLama',
                                //     //rt
                                //     '10',
                                //     //rw
                                //     '11',
                                //     //gender
                                //     '1000101',
                                //     // golDarah,
                                //     '1000402',
                                //     // suku,
                                //     '1000501',
                                //     // agama,
                                //     '1000201',
                                //     // pendidikan,
                                //     '1000301',
                                //     // pekerjaan,
                                //     '1000601',
                                //     '+628985953469',
                                //     //provinsi
                                //     '18',
                                //     //kabupaten
                                //     '6',
                                //     //kec
                                //     '8',
                                //     //desa
                                //     '2001');

                                // Dummy From this page
                                // Get.to(FrustatedPage(), arguments: [
                                //   _userId,
                                //   _name,
                                //   _nik,
                                //   _kk,
                                //   _tglLahir,
                                //   _kodePosController.text,
                                //   _alamatController.text,
                                //   _rtController.text,
                                //   _rwController.text,
                                //   _gender.toString(),
                                //   _golDarah.toString(),
                                //   _suku.toString(),
                                //   _agama.toString(),
                                //   _pendidikan.toString(),
                                //   _pekerjaan.toString(),
                                //   _noTelp,
                                //   _selectedProvinsi.toString(),
                                //   _selectedKabupaten.toString(),
                                //   _selectedKecamatan.toString(),
                                //   _selectedDesa.toString()
                                // ]);

                                // Success
                                // await context
                                //     .read<CreateProfileCubit>()
                                //     .createProfile(
                                // 1137,
                                // 'Julius',
                                // // nik,
                                // '1111',
                                // // kk
                                // '2222',
                                // '01-01-1990',
                                //         //kodepos
                                //         '35122',
                                // //alamat
                                // 'KebayoranLama',
                                // //rt
                                // '10',
                                // //rw
                                // '11',
                                // //gender
                                // '1000101',
                                // // golDarah,
                                // '1000402',
                                // // suku,
                                // '1000501',
                                // // agama,
                                // '1000201',
                                // // pendidikan,
                                // '1000301',
                                // // pekerjaan,
                                // '1000601',
                                // '+628985953469',
                                //         //provinsi
                                //         '18',
                                //         //kabupaten
                                //         '6',
                                //         //kec
                                //         '8',
                                //         //desa
                                //         '2001');

                                // Data From this Page
                                // await context
                                //     .read<CreateProfileCubit>()
                                //     .createProfile(
                                //         1137,
                                //         'Julius',
                                //         // nik,
                                //         '1111',
                                //         // kk
                                //         '2222',
                                //         '01-01-1990',
                                //         _kodePosController.text,
                                //         _alamatController.text,
                                //         _rtController.text,
                                //         _rwController.text,
                                //         //gender
                                //         '1000101',
                                //         // golDarah,
                                //         '1000402',
                                //         // suku,
                                //         '1000501',
                                //         // agama,
                                //         '1000201',
                                //         // pendidikan,
                                //         '1000301',
                                //         // pekerjaan,
                                //         '1000601',
                                //         '+628985953469',
                                //         // _gender.toString(),
                                //         // _golDarah.toString(),
                                //         // _suku.toString(),
                                //         // _agama.toString(),
                                //         // _pendidikan.toString(),
                                //         // _pekerjaan.toString(),
                                //         // _noTelp,
                                //         _selectedProvinsi.toString(),
                                //         _selectedKabupaten.toString(),
                                //         _selectedKecamatan.toString(),
                                //         _selectedDesa.toString());

                                // Without Data from this Page
                                // Success
                                // await context
                                //     .read<CreateProfileCubit>()
                                //     .createProfile(
                                //         _userId,
                                //         _name,
                                //         _nik,
                                //         _kk,
                                //         _tglLahir,
                                //         _kodePosController.text,
                                //         _alamatController.text,
                                //         _rtController.text,
                                //         _rwController.text,
                                //         _gender.toString(),
                                //         _golDarah.toString(),
                                //         _suku.toString(),
                                //         _agama.toString(),
                                //         _pendidikan.toString(),
                                //         _pekerjaan.toString(),
                                //         _noTelp,
                                //         //provinsi
                                //         '18',
                                //         //kabupaten
                                //         '6',
                                //         //kec
                                //         '8',
                                //         //desa
                                //         '2001');

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
                                        _selectedProvinsi.toString(),
                                        _selectedKabupaten.toString(),
                                        _selectedKecamatan.toString(),
                                        _selectedDesa.toString());

                                // try {
                                //   CreateProfileState stateProfile = context
                                //       .bloc<CreateProfileCubit>()
                                //       .state;

                                //   if (stateProfile is CreateProfileLoaded) {
                                //     // setState(() {
                                //     //   _isLoading = false;
                                //     // });

                                //     var _idProfile = (context
                                //             .bloc<CreateProfileCubit>()
                                //             .state as CreateProfileLoaded)
                                //         .profile
                                //         .id;

                                //     SharedPreferences prefs =
                                //         await SharedPreferences.getInstance();
                                //     await prefs.setInt(
                                //         KeySharedPreference.idProfile,
                                //         int.tryParse(_idProfile));

                                //     // Get Data Profile
                                //     await context
                                //         .bloc<ProfileCubit>()
                                //         .getProfile(_idProfile);

                                //     Get.offAllNamed(AppRoutes.PROFILE,
                                //         arguments: _userId);
                                //   } else if (stateProfile
                                //       is CreateProfileLoadingFailed) {
                                //     var message = (context
                                //                 .bloc<CreateProfileCubit>()
                                //                 .state
                                //             as CreateProfileLoadingFailed)
                                //         .message
                                //         .toString();
                                //     showSnackbar(
                                //         'Terjadi kesalahan!', message);
                                //     // setState(() {
                                //     //   _isLoading = false;
                                //     // });
                                //   }
                                // } catch (e) {
                                //   print(
                                //       'Register Page Exception : ${e.toString()}');
                                //   showSnackbar(
                                //       'Terjadi kesalahan!', e.toString());
                                // }
                              } catch (e) {
                                // setState(() {
                                //   _isLoading = false;
                                // });
                                // context.read<ProvinsiCubit>().getProvinsi();
                                print('Exception : ${e.toString()}');
                                showSnackbar('Terjadi Kesalahan',
                                    'Semua Kolom harus diisi.');
                              }
                            } else {
                              // setState(() {
                              //   _isLoading = false;
                              // });
                              // context.read<ProvinsiCubit>().getProvinsi();
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
        _selectedProvinsi != null &&
        _selectedKabupaten != null &&
        _selectedKecamatan != null &&
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
