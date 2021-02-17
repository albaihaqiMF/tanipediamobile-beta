part of 'pages.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _kodePosController = TextEditingController();
  TextEditingController _rwController = TextEditingController();
  TextEditingController _rtController = TextEditingController();
  TextEditingController _kkController = TextEditingController();

  bool _isLoading = false;
  bool _errorNameField = false;
  bool _errorNikField = false;
  bool _errorTglLahirField = false;
  bool _errorRTField = false;
  bool _errorRWField = false;
  bool _errorKodePosField = false;
  bool _errorKkField = false;

  int _userId = int.tryParse(Get.arguments[0]);
  String telp = Get.arguments[1];
  // int _userId = 1811;

  BloodTypes selectedBlood;
  Genders selectedGender;
  Categories selectedCategory;
  Educations selectedEducation;
  Religions selectedReligion;
  Ethnics selectedEthnic;
  Professions selectedProfession;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendaftaran Data Diri'),
        brightness: Brightness.light,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nama',
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
                      errorText:
                          _errorNameField ? 'Kolom tidak boleh kosong' : null,
                    ),
                    controller: _nameController,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nomor KTP (NIK)',
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
                      errorText:
                          _errorNikField ? 'Kolom tidak boleh kosong' : null,
                    ),
                    controller: _nikController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nomor KK',
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
                      errorText:
                          _errorKkField ? 'Kolom tidak boleh kosong' : null,
                    ),
                    controller: _kkController,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Kode Pos',
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
                      errorText: _errorKodePosField
                          ? 'Kolom tidak boleh kosong'
                          : null,
                    ),
                    keyboardType: TextInputType.number,
                    controller: _kodePosController,
                  ),
                  SizedBox(height: 20),
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
                      hintStyle: blackFontStyle4,
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
                      errorText: _errorTglLahirField
                          ? 'Kolom tidak boleh kosong'
                          : null,
                    ),
                    controller: _tglLahirController,
                  ),

                  // SizedBox(height: 20),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'RT',
                  //     hintText: 'Masukkan RT',
                  //     hintStyle: greyFontStyle,
                  //     contentPadding: EdgeInsets.all(16),
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
                  //         _errorRTField ? 'Kolom tidak boleh kosong' : null,
                  //   ),
                  //   keyboardType: TextInputType.number,
                  //   controller: _rtController,
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'RW/LK/Dusun',
                  //     hintText: 'Masukkan RW/LK/Dusun',
                  //     hintStyle: greyFontStyle,
                  //     contentPadding: EdgeInsets.all(16),
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
                  //         _errorRWField ? 'Kolom tidak boleh kosong' : null,
                  //   ),
                  //   keyboardType: TextInputType.number,
                  //   controller: _rwController,
                  // ),
                ],
              ),
            ),
            wrapDropdown(DropdownButton(
                hint: Text('Pilih Jenis Kelamin', style: blackFontStyle3),
                focusColor: Colors.blue,
                isExpanded: true,
                style: blackFontStyle3,
                items: Genders.generatedItem(Genders.items),
                value: selectedGender,
                onChanged: (item) {
                  setState(() {
                    selectedGender = item;
                  });
                })),
            wrapDropdown(
              DropdownButton(
                  hint: Text('Pilih Golongan Darah', style: blackFontStyle3),
                  focusColor: Colors.blue,
                  isExpanded: true,
                  style: blackFontStyle3,
                  items: BloodTypes.generatedItem(BloodTypes.items),
                  value: selectedBlood,
                  onChanged: (item) {
                    setState(() {
                      selectedBlood = item;
                    });
                  }),
            ),
            wrapDropdown(
              DropdownButton(
                  hint: Text('Pilih Suku', style: blackFontStyle3),
                  focusColor: Colors.blue,
                  isExpanded: true,
                  style: blackFontStyle3,
                  items: Ethnics.generatedItem(Ethnics.items),
                  value: selectedEthnic,
                  onChanged: (item) {
                    setState(() {
                      selectedEthnic = item;
                    });
                  }),
            ),
            wrapDropdown(
              DropdownButton(
                  hint:
                      Text('Pilih Pendidikan Terakhir', style: blackFontStyle3),
                  focusColor: Colors.blue,
                  isExpanded: true,
                  style: blackFontStyle3,
                  items: Educations.generatedItem(Educations.items),
                  value: selectedEducation,
                  onChanged: (item) {
                    setState(() {
                      selectedEducation = item;
                    });
                  }),
            ),
            wrapDropdown(
              DropdownButton(
                  hint: Text('Pilih Pekerjaan', style: blackFontStyle3),
                  focusColor: Colors.blue,
                  isExpanded: true,
                  style: blackFontStyle3,
                  items: Professions.generatedItem(Professions.items),
                  value: selectedProfession,
                  onChanged: (item) {
                    setState(() {
                      selectedProfession = item;
                    });
                  }),
            ),
            wrapDropdown(
              DropdownButton(
                  hint: Text('Pilih Kategori', style: blackFontStyle3),
                  focusColor: Colors.blue,
                  isExpanded: true,
                  style: blackFontStyle3,
                  items: Categories.generatedItem(Categories.items),
                  value: selectedCategory,
                  onChanged: (item) {
                    setState(() {
                      selectedCategory = item;
                    });
                  }),
            ),
            wrapDropdown(
              DropdownButton(
                  hint: Text('Pilih Agama', style: blackFontStyle3),
                  focusColor: Colors.blue,
                  isExpanded: true,
                  style: blackFontStyle3,
                  items: Religions.generatedItem(Religions.items),
                  value: selectedReligion,
                  onChanged: (item) {
                    setState(() {
                      selectedReligion = item;
                    });
                  }),
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
                        setState(() {
                          validationField();
                        });
                        if (!_errorNameField &&
                            !_errorKodePosField &&
                            !_errorNikField &&
                            // !_errorRTField &&
                            // !_errorRWField &&
                            !_errorTglLahirField) {
                          _isLoading = true;
                          try {
                            await context
                                .bloc<CreateProfileCubit>()
                                .createProfile(
                                    _userId,
                                    _nameController.text,
                                    int.tryParse(_nikController.text),
                                    int.tryParse(_kkController.text),
                                    _tglLahirController.text,
                                    int.tryParse(_kodePosController.text),
                                    _rtController.text,
                                    _rwController.text,
                                    selectedGender.code,
                                    selectedBlood.code,
                                    selectedEthnic.code,
                                    selectedReligion.code,
                                    selectedEducation.code,
                                    selectedProfession.code,
                                    selectedCategory.code,
                                    telp);
                          } catch (e) {
                            setState(() {
                              _isLoading = false;
                            });
                            print('Exception : ${e.toString()}');
                            showSnackbar('Terjadi Kesalahan',
                                'Semua Kolom harus diisi.');
                          }
                        }
                        CreateProfileState state =
                            context.bloc<CreateProfileCubit>().state;

                        if (state is CreateProfileLoaded) {
                          setState(() {
                            _isLoading = false;
                          });

                          var _idProfile = (context
                                  .bloc<CreateProfileCubit>()
                                  .state as CreateProfileLoaded)
                              .profile
                              .id;

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setInt(KeySharedPreference.idProfile,
                              int.tryParse(_idProfile));

                          // Get Data Profile
                          await context
                              .bloc<ProfileCubit>()
                              .getProfile(int.tryParse(_idProfile));

                          Get.offAll(ProfilePage(), arguments: _userId);
                        } else if (state is CreateProfileLoadingFailed) {
                          var message = (context
                                  .bloc<CreateProfileCubit>()
                                  .state as CreateProfileLoadingFailed)
                              .message
                              .toString();
                          showSnackbar('Terjadi kesalahan!', message);
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      },
                      text: 'Selesai',
                      color: mainColor),
            )
          ],
        ),
      ),
    );
  }

  void validationField() {
    _nameController.text.isEmpty
        ? _errorNameField = true
        : _errorNameField = false;
    _nikController.text.isEmpty
        ? _errorNikField = true
        : _errorNikField = false;
    _kkController.text.isEmpty ? _errorKkField = true : _errorKkField = false;
    _kodePosController.text.isEmpty
        ? _errorKodePosField = true
        : _errorKodePosField = false;
    _tglLahirController.text.isEmpty
        ? _errorTglLahirField = true
        : _errorTglLahirField = false;
    // _rtController.text.isEmpty ? _errorRTField = true : _errorRTField = false;
    // _rwController.text.isEmpty ? _errorRWField = true : _errorRWField = false;
  }

  @override
  void dispose() {
    _rtController.dispose();
    _rwController.dispose();
    _nameController.dispose();
    _nikController.dispose();
    _kodePosController.dispose();
    _tglLahirController.dispose();
    _kkController.dispose();
    super.dispose();
  }
}
