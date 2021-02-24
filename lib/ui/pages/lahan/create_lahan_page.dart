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

  Desa _selectedDesa;
  Kecamatan _selectedKecamatan;
  Kabupaten _selectedKabupaten;
  Provinsi _selectedProvinsi;
  Categories _selectedCategory;

  bool _isLoading = false;
  bool _errorLuasField = false;
  bool _errorSatuanField = false;
  bool _errorUsiaTanamField = false;
  bool _errorAlamatField = false;

  String idPetani = '1';
  String idInstansi = '2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Lahan'),
        brightness: Brightness.light,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Luas',
                      hintText: 'Masukkan Luas Lahan',
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
                          _errorLuasField ? 'Kolom tidak boleh kosong' : null,
                    ),
                    controller: _luasController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Satuan',
                      hintText: 'Masukkan Satuan Lahan',
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
                          _errorSatuanField ? 'Kolom tidak boleh kosong' : null,
                    ),
                    controller: _satuanController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Usia Tanam',
                      hintText: 'Masukkan Usia Tanam Lahan',
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
                      errorText: _errorUsiaTanamField
                          ? 'Kolom tidak boleh kosong'
                          : null,
                    ),
                    controller: _usiaTanamController,
                    keyboardType: TextInputType.number,
                  ),
                  wrapDropdown(DropdownButton(
                      hint: Text('Pilih Kategori', style: blackFontStyle3),
                      focusColor: Colors.blue,
                      isExpanded: true,
                      style: blackFontStyle3,
                      items: Categories.generatedItem(Categories.items),
                      value: _selectedCategory,
                      onChanged: (item) {
                        setState(() {
                          _selectedCategory = item;
                        });
                      })),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Alamat',
                      hintText: 'Masukkan Alamat Lahan',
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
                          _errorAlamatField ? 'Kolom tidak boleh kosong' : null,
                    ),
                    controller: _alamatController,
                  ),
                  wrapDropdown(DropdownButton(
                      hint: Text('Pilih Desa', style: blackFontStyle3),
                      focusColor: Colors.blue,
                      isExpanded: true,
                      style: blackFontStyle3,
                      items: Desa.generatedItem(Desa.items),
                      value: _selectedDesa,
                      onChanged: (item) {
                        setState(() {
                          _selectedDesa = item;
                        });
                      })),
                  wrapDropdown(DropdownButton(
                      hint: Text('Pilih Kecamatan', style: blackFontStyle3),
                      focusColor: Colors.blue,
                      isExpanded: true,
                      style: blackFontStyle3,
                      items: Kecamatan.generatedItem(Kecamatan.items),
                      value: _selectedKecamatan,
                      onChanged: (item) {
                        setState(() {
                          _selectedKecamatan = item;
                        });
                      })),
                  wrapDropdown(DropdownButton(
                      hint: Text('Pilih Kabupaten', style: blackFontStyle3),
                      focusColor: Colors.blue,
                      isExpanded: true,
                      style: blackFontStyle3,
                      items: Kabupaten.generatedItem(Kabupaten.items),
                      value: _selectedKabupaten,
                      onChanged: (item) {
                        setState(() {
                          _selectedKabupaten = item;
                        });
                      })),
                  wrapDropdown(DropdownButton(
                      hint: Text('Pilih Provinsi', style: blackFontStyle3),
                      focusColor: Colors.blue,
                      isExpanded: true,
                      style: blackFontStyle3,
                      items: Provinsi.generatedItem(Provinsi.items),
                      value: _selectedProvinsi,
                      onChanged: (item) {
                        setState(() {
                          _selectedProvinsi = item;
                        });
                      })),
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
                                setState(() {
                                  _validationField();
                                });
                                if (!_errorAlamatField &&
                                    !_errorLuasField &&
                                    !_errorSatuanField &&
                                    !_errorUsiaTanamField) {
                                  _isLoading = true;
                                  try {
                                    await context
                                        .bloc<CreateLahanCubit>()
                                        .createLahan(
                                            _selectedCategory.code,
                                            int.tryParse(_luasController.text),
                                            int.tryParse(
                                                _satuanController.text),
                                            _usiaTanamController.text,
                                            idPetani,
                                            idInstansi,
                                            _alamatController.text,
                                            _selectedDesa.code,
                                            _selectedKecamatan.code,
                                            _selectedKabupaten.code,
                                            _selectedProvinsi.code,
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
                                      context.bloc<CreateLahanCubit>().state;
                                  if (state is CreateLahanLoaded) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    context
                                        .bloc<GetListLahanCubit>()
                                        .getListLahan();
                                    Get.to(ListLahanPage());
                                  } else if (state is CreateLahanFailed) {
                                    var message = (context
                                            .bloc<CreateLahanCubit>()
                                            .state as CreateLahanFailed)
                                        .message
                                        .toString();
                                    showSnackbar('Terjadi kesalahan!', message);
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
            )
          ],
        ),
      ),
    );
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
