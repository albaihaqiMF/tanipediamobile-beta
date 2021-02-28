part of '../pages.dart';

class CreatePanenPage extends StatefulWidget {
  @override
  _CreatePanenPageState createState() => _CreatePanenPageState();
}

class _CreatePanenPageState extends State<CreatePanenPage> {
  String _idProfile;
  String _idPanen;
  int _selectedKategoriPertanian;
  // Field
  TextEditingController _totalPanenController = TextEditingController();
  TextEditingController _satuanController = TextEditingController();
  TextEditingController _usiaTanamController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  TextEditingController _tglTanamController = TextEditingController();
  TextEditingController _tglPanenController = TextEditingController();

  bool isUpdate;

  isUpdatePanen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isUpdate = sharedPreferences.getBool(KeySharedPreference.updatePanen);
    print('Panen UPDATE : $isUpdate');
    if (isUpdate) {
      final dataResponse =
          (context.read<GetDetailPanenCubit>().state as GetDetailPanenLoaded);
      _idPanen = dataResponse.panen.id;
      print('Prefs : $_idPanen');
      _satuanController.text = dataResponse.panen.satuan.toString();
      _keteranganController.text = dataResponse.panen.keterangan;
      _usiaTanamController.text = dataResponse.panen.usiaTanam.toString();
      _tglTanamController.text = dataResponse.panen.tglTanam.toString();
      _tglPanenController.text = dataResponse.panen.tglPanen.toString();
      _totalPanenController.text = dataResponse.panen.totalPanen.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    isUpdatePanen();
  }

  @override
  Widget build(BuildContext context) {
    final data = (context.watch<ProfileCubit>().state as ProfileLoaded);
    _idProfile = data.profile.id;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text('Tambah Panen', style: mainFontBoldStyle1),
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: mainColor, width: 2)),
              child: SmartSelect<String>.single(
                choiceStyle: S2ChoiceStyle(accentColor: Colors.red),
                title: 'Kategori',
                modalHeaderStyle: S2ModalHeaderStyle(
                    backgroundColor: mainColor, textStyle: whiteFontBoldStyle3),
                modalStyle: S2ModalStyle(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                modalType: S2ModalType.popupDialog,
                value: _selectedKategoriPertanian.toString(),
                choiceItems: LocalData.jenisPertanian,
                onChange: (selected) =>
                    _selectedKategoriPertanian = int.tryParse(selected.value),
                tileBuilder: (context, state) {
                  return ListTile(
                    title: Text(state.title,
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
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
              keyboardType: TextInputType.number,
              controller: _totalPanenController,
              decoration: InputDecoration(
                labelText: 'Total Panen',
                labelStyle: greyFontStyle,
                hintText: 'Masukkan Total Panen...',
                hintStyle: greyFontStyle,
                suffixText: '(Kwintal)',
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
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Satuan',
                labelStyle: greyFontStyle,
                hintText: 'Masukkan Satuan...',
                // suffixText: '(Kwintal)',
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
              keyboardType: TextInputType.number,
              controller: _satuanController,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Keterangan',
                labelStyle: greyFontStyle,
                hintText: 'Masukkan Keterangan...',
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
              controller: _keteranganController,
            ),
            SizedBox(height: 20),
            TextField(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now())
                    .then((date) {
                  var formattedDate = DateFormat(dateFormatName).format(date);
                  setState(() {
                    if (date == null) {
                      _tglTanamController.text = "Masukan Tanggal Tanam";
                    } else {
                      _tglTanamController.text = formattedDate;
                    }
                  });
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Masukkan Tanggal Tanam',
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
              ),
              controller: _tglTanamController,
            ),
            SizedBox(height: 20),
            TextField(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now())
                    .then((date) {
                  var formattedDate = DateFormat(dateFormatName).format(date);
                  setState(() {
                    if (date == null) {
                      _tglPanenController.text = "Masukan Tanggal Panen";
                    } else {
                      _tglPanenController.text = formattedDate;
                    }
                  });
                });
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Masukkan Tanggal Panen',
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
              ),
              controller: _tglPanenController,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Usia Tanam',
                labelStyle: greyFontStyle,
                hintText: 'Masukkan Usia Tanam...',
                suffixText: '(minggu)',
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
              keyboardType: TextInputType.number,
              controller: _usiaTanamController,
            ),
            SizedBox(height: 20),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                margin: EdgeInsets.only(bottom: defaultMargin),
                child: CustomButton(
                    onPress: () => (isUpdate) ? onUpdate() : onPost(),
                    text: 'Selesai',
                    color: mainColor)),
          ],
        ),
      ),
    );
  }

  void onPost() async {
    if (validationField()) {
      showProgressDialog(context, 'Mohon tunggu...');
      try {
        await context.read<CreatePanenCubit>().createPanen(
            _idProfile,
            // _selectedKategoriPertanian.toString(),
            '1234',
            int.tryParse(_totalPanenController.text),
            int.tryParse(_satuanController.text),
            _usiaTanamController.text,
            _tglTanamController.text,
            _tglPanenController.text,
            _keteranganController.text);

        CreatePanenState state = context.read<CreatePanenCubit>().state;
        if (state is CreatePanenLoaded) {
          dismissProgressDialog(context);
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => SuccessDialog(
                    title: 'Sukses',
                    description: 'Anda berhasil menambahkan panen',
                    onPress: () => Get.offNamedUntil(
                        AppRoutes.PANEN, ModalRoute.withName(AppRoutes.MAIN)),
                  ));
          // Get.off(ListPanenPage());
        } else if (state is CreatePanenFailed) {
          var message = state.message.toString();
          showSnackbar('Terjadi kesalahan!', message);
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

  void onUpdate() async {
    if (validationField() && _idPanen != null) {
      showProgressDialog(context, 'Mohon tunggu...');
      try {
        await context.read<UpdatePanenCubit>().updatePanen(
            _idPanen,
            _idProfile,
            // _selectedKategoriPertanian.toString(),
            '1234',
            int.tryParse(_totalPanenController.text),
            int.tryParse(_satuanController.text),
            _usiaTanamController.text,
            _tglTanamController.text,
            _tglPanenController.text,
            _keteranganController.text);

        UpdatePanenState state = context.read<UpdatePanenCubit>().state;
        if (state is UpdatePanenLoaded) {
          dismissProgressDialog(context);
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => SuccessDialog(
                    title: 'Sukses',
                    description: 'Anda berhasil mengubah data panen',
                    onPress: () => Get.offNamedUntil(AppRoutes.DETAIL_PANEN,
                        ModalRoute.withName(AppRoutes.PANEN)),
                  ));
        } else if (state is UpdatePanenFailed) {
          var message = state.message.toString();
          showSnackbar('Update Panen Gagal!', message);
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
    if (_totalPanenController.text != null &&
        _satuanController.text != null &&
        _usiaTanamController.text != null &&
        _keteranganController.text != null &&
        _tglTanamController.text != null &&
        _tglPanenController.text != null &&
        _idProfile != null &&
        // _idPanen != null &&
        _selectedKategoriPertanian != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _totalPanenController.dispose();
    _satuanController.dispose();
    _usiaTanamController.dispose();
    _keteranganController.dispose();
    _tglTanamController.dispose();
    _tglPanenController.dispose();
    super.dispose();
  }
}
