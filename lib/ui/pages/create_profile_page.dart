part of 'pages.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  PickedFile _photoFile;
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _kodePosController = TextEditingController();
  TextEditingController _rwController = TextEditingController();
  TextEditingController _rtController = TextEditingController();

  bool _isLoading = false;
  bool _errorNameField = false;
  bool _errorNikField = false;
  bool _errorTglLahirField = false;
  bool _errorRTField = false;
  bool _errorRWField = false;
  bool _errorKodePosField = false;

  int _userId = int.tryParse(Get.arguments);
  // int userId = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            defaultMargin, defaultMargin, defaultMargin, 0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'Foto Profil',
                  style: blackFontBoldStyle2,
                ),
              ),
            ),
            imageProfile(context),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama',
                hintText: 'Masukkan Nama',
                hintStyle: greyFontStyle,
                contentPadding: EdgeInsets.all(16),
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
                errorText: _errorNameField ? 'Kolom tidak boleh kosong' : null,
              ),
              controller: _nameController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'NIK',
                hintText: 'Masukkan NIK',
                hintStyle: greyFontStyle,
                contentPadding: EdgeInsets.all(16),
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
                errorText: _errorNikField ? 'Kolom tidak boleh kosong' : null,
              ),
              controller: _nikController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
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
                contentPadding: EdgeInsets.all(16),
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
                    _errorTglLahirField ? 'Kolom tidak boleh kosong' : null,
              ),
              controller: _tglLahirController,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Kode Pos',
                hintText: 'Masukkan Kode Pos',
                hintStyle: greyFontStyle,
                contentPadding: EdgeInsets.all(16),
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
                    _errorKodePosField ? 'Kolom tidak boleh kosong' : null,
              ),
              keyboardType: TextInputType.number,
              controller: _kodePosController,
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
            //     errorText: _errorRTField ? 'Kolom tidak boleh kosong' : null,
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
            //     errorText: _errorRWField ? 'Kolom tidak boleh kosong' : null,
            //   ),
            //   keyboardType: TextInputType.number,
            //   controller: _rwController,
            // ),

            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                          await context
                              .bloc<CreateProfileCubit>()
                              .createProfile(
                                  _userId,
                                  _nameController.text,
                                  int.tryParse(_nikController.text),
                                  _tglLahirController.text,
                                  int.tryParse(_kodePosController.text),
                                  _rtController.text,
                                  _rwController.text);
                        }
                        CreateProfileState state =
                            context.bloc<CreateProfileCubit>().state;

                        if (state is CreateProfileLoaded) {
                          setState(() {
                            _isLoading = false;
                          });

                          context.bloc<ProfileCubit>().getProfile(_userId);
                          Get.offAll(ProfilePage());
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
    _kodePosController.text.isEmpty
        ? _errorKodePosField = true
        : _errorKodePosField = false;
    _tglLahirController.text.isEmpty
        ? _errorTglLahirField = true
        : _errorTglLahirField = false;
    // _rtController.text.isEmpty ? _errorRTField = true : _errorRTField = false;
    // _rwController.text.isEmpty ? _errorRWField = true : _errorRWField = false;
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(source: source);
    setState(() {
      _photoFile = pickedFile;
    });
  }

  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: _photoFile == null
                ? AssetImage("assets/ic_profile.png")
                : FileImage(File(_photoFile.path)),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: InkWell(
              onTap: () {
                showBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet(context)));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.7)),
                child: Icon(Icons.camera_alt_outlined,
                    size: 40, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      // color: mainColor,
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        border:
            Border.all(width: 3, color: Colors.green, style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Text('Pilih foto profil', style: blackFontStyle2),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.image),
                label: Text('Gallery'),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _rtController.dispose();
    _rwController.dispose();
    _nameController.dispose();
    _nikController.dispose();
    _kodePosController.dispose();
    _tglLahirController.dispose();
    super.dispose();
  }
}
