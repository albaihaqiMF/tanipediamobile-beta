part of '../pages.dart';

class CreateLahanPage extends StatefulWidget {
  @override
  _CreateLahanPageState createState() => _CreateLahanPageState();
}

class _CreateLahanPageState extends State<CreateLahanPage> {
  String apiToken;
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      apiToken = prefs.getString(KeySharedPreference.apiToken);
      context.read<ProvinsiCubit>().getProvinsi();
    });
  }

  isUpdateLahan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUpdate = prefs.getBool(KeySharedPreference.updateLahan);
    apiToken = prefs.getString(KeySharedPreference.apiToken);
    if (isUpdate) {
      final dataResponse =
      (context.read<GetDetailLahanCubit>().state as GetDetailLahanLoaded);
      _idLahan = dataResponse.lahan.id;
      _luasController.text = dataResponse.lahan.luas.toString();
      _alamatController.text = dataResponse.lahan.alamat;
      _usiaTanamController.text = dataResponse.lahan.usiaTanam.toString();
      setState(() {
      });
    }
  }

  bool isUpdate=false;
  String _idLahan;
  int idPetani;
  String idInstansi = '2';

  // Field
  TextEditingController _luasController = TextEditingController();
  TextEditingController _usiaTanamController = TextEditingController();
  TextEditingController _satuanController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  // Dialog title
  int _selectedDesa;
  int _selectedKecamatan;
  int _selectedKabupaten;
  int _selectedProvinsi;
  int _selectedKategoriPertanian;
  // Data Value (Post Data)
  String _idDesa;
  String _idKecamatan;
  String _idKabupaten;
  String _idProvinsi;

  List<S2Choice<String>> listProvinsi = [];
  List<S2Choice<String>> listKabupaten = [];
  List<S2Choice<String>> listKecamatan = [];
  List<S2Choice<String>> listDesa = [];



  @override
  void initState() {
    super.initState();
    getToken();
    isUpdateLahan();
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
    final dataProfile = (context.watch<ProfileCubit>().state as ProfileLoaded);
    idPetani = dataProfile.profile.id;

    //// Update belum mengerti
    /// jika update maka harusnya get Data/parsing dari detail
    /// lalu di laman ini set data tiap kolom dari data yg di get/parsing tsb.
    /// Tapi data address yg di get dari respon kan berupa String bukan kode/id desa,kecamatan,kabupaten,provinsi
    /// Sedangkan data yang di pos berupa kode/id
    /// Jadi otomatis kolom address tidak bisa terisi oleh data sebelumnya

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Text((isUpdate)?'Ubah Data Lahan':'Tambah Lahan Pertanian', style: mainFontBoldStyle1),
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
        body:
            //// ------------------------------------------- Dropdown Session-------------------------------------------
            BlocBuilder<ProvinsiCubit, ProvinsiState>(
          builder: (_, state) {
            if (state is ProvinsiLoaded) {
              List<Wilayah> listProvinsiAPI = state.wilayah.toList();
              for (int i = 0; i < listProvinsiAPI.length; i++) {
                listProvinsi.add(S2Choice<String>(
                    value: listProvinsiAPI[i].provinsi,
                    title: listProvinsiAPI[i].name));
              }
              return SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Luas Lahan (m3)',
                                hintText: 'Masukkan Luas Lahan (m3)',
                                hintStyle: greyFontStyle,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
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
                              controller: _luasController,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Usia Tanam (minggu)',
                                hintText: 'Masukkan Usia Tanam Lahan...',
                                hintStyle: greyFontStyle,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
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
                                suffixText: '(minggu)',
                              ),
                              controller: _usiaTanamController,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 10),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(color: mainColor, width: 2)),
                              child: SmartSelect<String>.single(
                                choiceStyle:
                                    S2ChoiceStyle(accentColor: Colors.red),
                                title: 'Kategori',
                                modalHeaderStyle: S2ModalHeaderStyle(
                                    backgroundColor: mainColor,
                                    textStyle: whiteFontBoldStyle3),
                                modalStyle: S2ModalStyle(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                modalType: S2ModalType.popupDialog,
                                value: _selectedKategoriPertanian.toString(),
                                choiceItems: LocalData.jenisPertanian,
                                onChange: (selected) =>
                                    _selectedKategoriPertanian =
                                        int.tryParse(selected.value),
                                tileBuilder: (context, state) {
                                  return ListTile(
                                    title: Text(state.title,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                    subtitle: Text(
                                      (state.valueTitle != null)
                                          ? state.valueTitle.toString()
                                          : 'Pilih Kategori',
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
                            SizedBox(height: 20),
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Alamat Pertanian',
                                hintText: 'Masukkan Alamat Lahan...',
                                hintStyle: greyFontStyle,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2),
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
                          ],
                        ),
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
                            //// Get id/value Provinsi
                            if (_selectedProvinsi != null) {
                              try {
                                await context
                                    .read<ProvinsiCubit>()
                                    .getProvinsi(provinsi: selected.value);
                                final data = (context
                                    .read<ProvinsiCubit>()
                                    .state as ProvinsiLoaded);
                                List<Wilayah> listValueProvinsi =
                                    data.wilayah.toList();
                                _idProvinsi = listValueProvinsi[0].id;
                                context
                                    .read<KabupatenCubit>()
                                    .getKabupaten(_selectedProvinsi.toString());
                              } catch (e) {
                                print(
                                    'Pick Provinsi Exception : ${e.toString()}');
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
                                _selectedKabupaten =
                                    int.tryParse(selected.value);
                                _selectedKecamatan = null;
                                _selectedDesa = null;
                                listKecamatan.clear();
                                listDesa.clear();
                                context.read<KecamatanCubit>().toInitial();
                                context.read<DesaCubit>().toInitial();

                                if (_selectedKabupaten != null) {
                                  //// Get id/value Kabupaten
                                  try {
                                    await context
                                        .read<KabupatenCubit>()
                                        .getKabupaten(
                                            _selectedProvinsi.toString(),
                                            kabupaten:
                                                _selectedKabupaten.toString());
                                    final data = (context
                                        .read<KabupatenCubit>()
                                        .state as KabupatenLoaded);
                                    List<Wilayah> listValue =
                                        data.wilayah.toList();
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
                                  side:
                                      BorderSide(color: Colors.grey, width: 2)),
                              child: SmartSelect<String>.single(
                                title: 'Kabupaten',
                                value: _selectedKabupaten.toString(),
                                choiceItems: listKabupaten,
                                onChange: (selected) => _selectedKabupaten =
                                    int.tryParse(selected.value),
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
                          List<Wilayah> listAPI =
                              stateKecamatan.wilayah.toList();

                          for (int i = 0; i < listAPI.length; i++) {
                            listKecamatan.add(S2Choice<String>(
                                value: listAPI[i].kecamatan,
                                title: listAPI[i].name));
                          }
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: mainColor, width: 2)),
                            child: SmartSelect<String>.single(
                              choiceStyle:
                                  S2ChoiceStyle(accentColor: Colors.red),
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
                                _selectedKecamatan =
                                    int.tryParse(selected.value);
                                _selectedDesa = null;
                                listDesa.clear();
                                context.read<DesaCubit>().toInitial();
                                if (_selectedKecamatan != null) {
                                  //// Get id/value Kabupaten
                                  try {
                                    await context
                                        .read<KecamatanCubit>()
                                        .getKecamatan(
                                            _selectedProvinsi.toString(),
                                            _selectedKabupaten.toString(),
                                            kecamatan:
                                                _selectedKecamatan.toString());
                                    final data = (context
                                        .read<KecamatanCubit>()
                                        .state as KecamatanLoaded);
                                    List<Wilayah> listValue =
                                        data.wilayah.toList();
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
                              onChange: (selected) => _selectedKabupaten =
                                  int.tryParse(selected.value),
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
                      BlocBuilder<DesaCubit, DesaState>(
                          builder: (_, stateDesa) {
                        if (stateDesa is DesaLoaded) {
                          List<Wilayah> listAPI = stateDesa.wilayah.toList();
                          for (int i = 0; i < listAPI.length; i++) {
                            listDesa.add(S2Choice<String>(
                                value: listAPI[i].desa,
                                title: listAPI[i].name));
                          }
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: BorderSide(color: mainColor, width: 2)),
                            child: SmartSelect<String>.single(
                              choiceStyle:
                                  S2ChoiceStyle(accentColor: Colors.red),
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
                                  //// Get id/value Desa
                                  try {
                                    await context.read<DesaCubit>().getDesa(
                                        _selectedProvinsi.toString(),
                                        _selectedKabupaten.toString(),
                                        _selectedKecamatan.toString(),
                                        desa: _selectedDesa.toString());
                                    final data = (context
                                        .read<DesaCubit>()
                                        .state as DesaLoaded);
                                    List<Wilayah> listValue =
                                        data.wilayah.toList();
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
                              onChange: (selected) => _selectedKabupaten =
                                  int.tryParse(selected.value),
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
                      SizedBox(
                        height: 20,
                      ),
                      //// ------------------------------------------- Button Session-------------------------------------------
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          margin: EdgeInsets.only(bottom: defaultMargin),
                          child: CustomButton(
                              onPress: () => (isUpdate)
                                  ? onUpdate(apiToken)
                                  : onPost(apiToken),
                              text: 'Selesai',
                              color: mainColor)),
                    ],
                  ),
                ),
              );
            }
            else if(state is ProvinsiFailed){
              return Center(child:Text('Terjadi Kesalahan'));
            }
            else {
              return Center(
                child: loadingIndicatorAnim,
              );
            }
          },
        ));
  }

  void onPost(String apiToken) async {
    if (validationField()) {
      try {
        showProgressDialog(context, 'Mohon tunggu...');

        await context.read<CreateLahanCubit>().createLahan(
            apiToken,
            _selectedKategoriPertanian.toString(),
            int.tryParse(_luasController.text),
            // _satuanController.text,
            _usiaTanamController.text,
            idPetani,
            idInstansi,
            _alamatController.text,
            _idDesa,
            _idKecamatan,
            _idKabupaten,
            _idProvinsi,
            '-111.00',
            '-134.00');

        CreateLahanState state = context.read<CreateLahanCubit>().state;
        if (state is CreateLahanLoaded) {
          dismissProgressDialog(context);
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => SuccessDialog(
                    title: 'Sukses',
                    description: 'Anda berhasil menambahkan lahan',
                    onPress: () => Get.offNamedUntil(
                        AppRoutes.LAHAN, ModalRoute.withName(AppRoutes.MAIN)),
                  ));
        } else if (state is CreateLahanFailed) {
          var message = state.message.toString();
          showSnackbar('Tambah Lahan Gagal!', message);
          dismissProgressDialog(context);
        }
      } catch (e) {
        dismissProgressDialog(context);
        print('Exception : ${e.toString()}');
        showSnackbar('Terjadi Kesalahan', 'Semua Kolom harus diisi.');
      }
    } else {
      showSnackbar('Terjadi Kesalahan', 'Semua kolom harus diisi..');
    }
  }

  void onUpdate(String apiToken) async {
    if (validationField()) {
      try {
        showProgressDialog(context, 'Mohon tunggu...');
        await context.read<UpdateLahanCubit>().updateLahan(
            apiToken,
            _idLahan,
            _selectedKategoriPertanian.toString(),
            int.tryParse(_luasController.text),
            // _satuanController.text,
            _usiaTanamController.text,
            idPetani,
            idInstansi,
            _alamatController.text,
            _idDesa,
            _idKecamatan,
            _idKabupaten,
            _idProvinsi,
            '-111.00',
            '-134.00');

        UpdateLahanState state = context.read<UpdateLahanCubit>().state;
        if (state is UpdateLahanLoaded) {
          dismissProgressDialog(context);
          context.read<GetDetailLahanCubit>().toInitial();
          context.read<GetDetailLahanCubit>().getDetailLahan(apiToken, state.lahan.id);
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => SuccessDialog(
                    title: 'Sukses',
                    description: 'Anda berhasil mengupdate lahan',
                    onPress: () => Get.offNamedUntil(
                        AppRoutes.DETAIL_LAHAN, ModalRoute.withName(AppRoutes.LAHAN)),
                  ));
        } else if (state is UpdateLahanFailed) {
          var message = state.message.toString();
          showSnackbar('Update Lahan Gagal!', message);
          dismissProgressDialog(context);
        }
      } catch (e) {
        dismissProgressDialog(context);
        print('Exception : ${e.toString()}');
        showSnackbar('Terjadi Kesalahan', 'Semua Kolom harus diisi.');
      }
    } else {
      showSnackbar('Terjadi Kesalahan', 'Semua kolom harus diisi..');
    }
  }

  bool validationField() {
    if (_luasController.text.isNotEmpty &&
        _usiaTanamController.text.isNotEmpty &&
        _alamatController.text.isNotEmpty &&
        _idDesa != null &&
        _idKecamatan != null &&
        _idKabupaten != null &&
        _idProvinsi != null &&
        _selectedKategoriPertanian != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _luasController.dispose();
    _usiaTanamController.dispose();
    _satuanController.dispose();
    _alamatController.dispose();
    super.dispose();
  }
}
