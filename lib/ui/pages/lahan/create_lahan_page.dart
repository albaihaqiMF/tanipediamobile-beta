part of '../pages.dart';

class CreateLahanPage extends StatefulWidget {
  @override
  _CreateLahanPageState createState() => _CreateLahanPageState();
}

class _CreateLahanPageState extends State<CreateLahanPage> {
  TextEditingController _luasController = TextEditingController();
  TextEditingController _usiaTanamController = TextEditingController();
  TextEditingController _satuanController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  // Desa _selectedDesa;
  // Kecamatan _selectedKecamatan;
  // Kabupaten _selectedKabupaten;
  // Provinsi _selectedProvinsi;
  // Categories _selectedCategory;

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
  bool _errorLuasField = false;
  bool _errorSatuanField = false;
  bool _errorUsiaTanamField = false;
  bool _errorAlamatField = false;

  String idPetani = '1';
  String idInstansi = '2';

  @override
  Widget build(BuildContext context) {
    context.read<ProvinsiCubit>().getProvinsi();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: Text('Tambah Lahan Pertanian', style: mainFontBoldStyle1),
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
              return Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
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
                              errorText: _errorLuasField
                                  ? 'Kolom tidak boleh kosong'
                                  : null,
                            ),
                            controller: _luasController,
                            keyboardType: TextInputType.number,
                          ),
                          // SizedBox(height: 20),
                          // TextField(
                          //   decoration: InputDecoration(
                          //     labelText: 'Satuan',
                          //     hintText: 'Masukkan Satuan Lahan',
                          //     hintStyle: greyFontStyle,
                          //     contentPadding:
                          //         EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          //     focusedBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.blue, width: 2),
                          //         borderRadius: BorderRadius.circular(10)),
                          //     enabledBorder: (OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //           color: mainColor,
                          //           width: 2,
                          //         ),
                          //         borderRadius: BorderRadius.circular(10))),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //     ),
                          //     errorText:
                          //         _errorSatuanField ? 'Kolom tidak boleh kosong' : null,
                          //   ),
                          //   controller: _satuanController,
                          //   keyboardType: TextInputType.number,
                          // ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Usia Tanam (minggu)',
                              hintText: 'Masukkan Usia Tanam Lahan...',
                              hintStyle: greyFontStyle,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
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
                              suffixText: '(minggu)',
                              errorText: _errorUsiaTanamField
                                  ? 'Kolom tidak boleh kosong'
                                  : null,
                            ),
                            controller: _usiaTanamController,
                            keyboardType: TextInputType.number,
                          ),
                          // wrapDropdown(DropdownButton(
                          //     hint: Text('Pilih Kategori', style: blackFontStyle3),
                          //     focusColor: Colors.blue,
                          //     isExpanded: true,
                          //     style: blackFontStyle3,
                          //     items: Categories.generatedItem(Categories.items),
                          //     value: _selectedCategory,
                          //     onChanged: (item) {
                          //       setState(() {
                          //         _selectedCategory = item;
                          //       });
                          //     })),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Alamat Pertanian',
                              hintText: 'Masukkan Alamat Lahan...',
                              hintStyle: greyFontStyle,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
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
                              errorText: _errorAlamatField
                                  ? 'Kolom tidak boleh kosong'
                                  : null,
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
                          if (_selectedProvinsi != null) {
                            context
                                .read<KabupatenCubit>()
                                .getKabupaten(_selectedProvinsi.toString());
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
                              _selectedKabupaten = int.tryParse(selected.value);
                              _selectedKecamatan = null;
                              _selectedDesa = null;
                              listKecamatan.clear();
                              listDesa.clear();
                              context.read<KecamatanCubit>().toInitial();
                              context.read<DesaCubit>().toInitial();
                              //// Get id/value Kabupaten
                              try {
                                await context
                                    .read<KabupatenCubit>()
                                    .getKabupaten(_selectedProvinsi.toString(),
                                        kabupaten:
                                            _selectedKabupaten.toString());
                                final data = (context
                                    .read<KabupatenCubit>()
                                    .state as KabupatenLoaded);
                                List<Wilayah> listValue = data.wilayah.toList();
                                _idKabupaten = listValue[0].id;
                              } catch (e) {
                                print(
                                    'Pick Kabupaten Exception : ${e.toString()}');
                              }
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
                        List<Wilayah> listAPI = stateKecamatan.wilayah.toList();

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
                              //// Get id/value Kabupaten
                              _selectedDesa = null;
                              listDesa.clear();
                              context.read<DesaCubit>().toInitial();
                              try {
                                await context
                                    .read<KecamatanCubit>()
                                    .getKecamatan(_selectedProvinsi.toString(),
                                        _selectedKabupaten.toString(),
                                        kecamatan:
                                            _selectedKecamatan.toString());
                                final data = (context
                                    .read<KecamatanCubit>()
                                    .state as KecamatanLoaded);
                                List<Wilayah> listValue = data.wilayah.toList();
                                _idKecamatan = listValue[0].id;
                              } catch (e) {
                                print(
                                    'Pick Kecamatan Exception : ${e.toString()}');
                              }
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
                        child: (_isLoading)
                            ? loadingIndicator
                            : CustomButton(
                                onPress: () async {
                                  setState(() {
                                    _validationField();
                                  });
                                  if (!_errorAlamatField &&
                                      !_errorLuasField &&
                                      !_errorUsiaTanamField) {
                                    try {
                                      setState(() {
                                        _isLoading = true;
                                      });

                                      await context
                                          .read<CreateLahanCubit>()
                                          .createLahan(
                                              // _selectedCategory.code,
                                              int.tryParse(
                                                  _luasController.text),
                                              int.tryParse(
                                                  _satuanController.text),
                                              _usiaTanamController.text,
                                              idPetani,
                                              idInstansi,
                                              _alamatController.text,
                                              _idProvinsi,
                                              _idKabupaten,
                                              _idKecamatan,
                                              _idDesa,
                                              '-111.00',
                                              '-134.00');
                                    } catch (e) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      print('Exception : ${e.toString()}');
                                      showSnackbar('Terjadi Kesalahan',
                                          'Semua Kolom harus diisi.');
                                    }

                                    CreateLahanState state =
                                        context.read<CreateLahanCubit>().state;
                                    if (state is CreateLahanLoaded) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      context
                                          .read<GetListLahanCubit>()
                                          .getListLahan();

                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) => SuccessDialog(
                                                title: 'Succes',
                                                description:
                                                    'Anda berhasil menambahkan lahan',
                                                onPress: () => Get.offNamed(
                                                    AppRoutes.LAHAN),
                                              ));
                                      // Get.to(ListLahanPage());
                                    } else if (state is CreateLahanFailed) {
                                      var message = (context
                                              .read<CreateLahanCubit>()
                                              .state as CreateLahanFailed)
                                          .message
                                          .toString();
                                      showSnackbar(
                                          'Terjadi kesalahan!', message);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  }
                                },
                                text: 'Selesai',
                                color: mainColor)),
                  ],
                ),
              );
            } else {
              return Center(
                child: loadingIndicator,
              );
            }
          },
        ));
  }

  void _validationField() {
    _luasController.text.isEmpty
        ? _errorLuasField = true
        : _errorLuasField = false;
    _usiaTanamController.text.isEmpty
        ? _errorUsiaTanamField = true
        : _errorUsiaTanamField = false;
    _satuanController.text.isEmpty
        ? _errorSatuanField = true
        : _errorSatuanField = false;
    _alamatController.text.isEmpty
        ? _errorAlamatField = true
        : _errorAlamatField = false;
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
