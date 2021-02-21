part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _imagePicker = ImagePicker();
  final scaffoldState = GlobalKey<ScaffoldState>();
  String _updateFotoProfil;

  Widget build(BuildContext context) {
    ProfileState stateProfile = context.watch<ProfileCubit>().state;

    final data = (context.watch<ProfileCubit>().state as ProfileLoaded);
    String nama = data.profile.nama;
    String noTelp = data.profile.telepon;
    String tglLahir = data.profile.tglLahir;
    String gender = data.profile.gender;
    String agama = data.profile.agama;
    String suku = data.profile.suku;
    String pekerjaan = data.profile.pekerjaan;
    String pendidikan = data.profile.pendidikan;
    String kategori = data.profile.kategori;
    String kk = data.profile.kk;
    String nik = data.profile.nik;
    String kodePos = data.profile.kodepos;
    String golDarah = data.profile.golDarah;
    String _pathFoto = data.profile.fotoProfil;

    String _fotoProfil;
    if (_pathFoto != null) {
      _fotoProfil = ApiUrl.baseURL + _pathFoto.substring(8);
    }

    return Scaffold(
      key: scaffoldState,
      body: Container(
        child: (stateProfile is ProfileInitial)
            ? loadingIndicator
            : ListView(
                children: [
                  Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                      ),
                      width: double.infinity,
                      height: 210,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          imageProfile(context, _fotoProfil, _updateFotoProfil),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Center(
                              child: Text(
                                (nama != null) ? nama : '-',
                                style: blackFontBoldStyle3,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Center(
                              child: Text(
                                (noTelp != null) ? noTelp : '-',
                                style: blackFontStyle4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Column(
                      children: [
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.all(14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tanggal Lahir',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Jenis Kelamin',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Golongan Darah',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Agama',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Suku',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Pekerjaan',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Pendidikan',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Kategori',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Nomor KK',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'NIK',
                                        style: greyFontStyle,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Kode Pos',
                                        style: greyFontStyle,
                                      ),
                                    ]),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      (tglLahir != null) ? tglLahir : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (gender != null) ? gender : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (golDarah != null) ? golDarah : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (agama != null) ? agama : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (suku != null) ? suku : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (pekerjaan != null) ? pekerjaan : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (pendidikan != null) ? pendidikan : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (kategori != null) ? kategori : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (kk != null) ? kk : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (nik != null) ? nik : '-',
                                      style: blackFontStyle4,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      (kodePos != null) ? kodePos : '-',
                                      style: blackFontStyle4,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined,
                                      color: mainColor),
                                  SizedBox(width: 10),
                                  Text('Alamat'),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  Icon(Icons.assistant_photo_outlined,
                                      color: mainColor),
                                  SizedBox(width: 10),
                                  Text('Profil Pertanian'),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 16),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 5),
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  Icon(Icons.spa_outlined, color: mainColor),
                                  SizedBox(width: 10),
                                  Text('Profil Pertanian'),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 16),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void takePhoto(ImageSource source, BuildContext context) async {
    final _pickedFile = await _imagePicker.getImage(source: source);
    String imagePath = AppConverter.toBase64(_pickedFile);
    SharedPreferences sf = await SharedPreferences.getInstance();
    final idProfil = sf.getInt(KeySharedPreference.idProfile);
    showProgressDialog(context);

    await context
        .read<UploadPhotoProfileCubit>()
        .uploadPhotoProfile(idProfil, imagePath);
    showProgressDialog(context);

    Get.back();

    UploadPhotoProfileState state =
        context.read<UploadPhotoProfileCubit>().state;
    try {
      if (state is UploadPhotoProfileLoaded) {
        String _dataImage = (context.bloc<UploadPhotoProfileCubit>().state
                as UploadPhotoProfileLoaded)
            .profile
            .fotoProfil;
        String pathImage = _dataImage.substring(8);
        setState(() {
          _updateFotoProfil = ApiUrl.baseURL + pathImage;
          print('Image API : $_updateFotoProfil');
        });
        dismissProgressDialog(context);
      } else {
        print('Else Statement');
        print('$state');
        showSnackbar('Terjadi Kesalahan', 'Gagal mengganti foto profil.');
      }
    } catch (e) {
      print('GAGAL masang foto ${e.toString()}');
      dismissProgressDialog(context);
      showSnackbar('Terjadi Kesalahan', 'Gagal mengganti foto profil.');
    }
  }

  Widget showBackground() {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(.5));
  }

  Widget imageProfile(
      BuildContext context, String imageUrl, String imageUpdate) {
    UploadPhotoProfileState statePhoto =
        context.watch<UploadPhotoProfileCubit>().state;

    return Center(
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            child: (statePhoto is UploadPhotoProfileLoaded)
                ? CircleAvatar(
                    radius: 80,
                    backgroundImage: imageUpdate != null
                        ? NetworkImage(imageUpdate)
                        : AssetImage("assets/ic_profile.png"),
                  )
                : CircleAvatar(
                    radius: 80,
                    backgroundImage: imageUrl != null
                        ? NetworkImage(imageUrl)
                        : AssetImage("assets/ic_profile.png")),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: InkWell(
              onTap: () {
                showBackground();
                scaffoldState.currentState
                    .showBottomSheet((context) => bottomSheet(context));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.7)),
                child: Icon(Icons.camera_alt_outlined,
                    size: 20, color: Colors.white),
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
          Stack(children: [
            Align(
                alignment: Alignment.center,
                child: Text('Pilih foto profil', style: blackFontStyle2)),
            Align(
                alignment: Alignment.topRight,
                child:
                    InkWell(onTap: () => Get.back(), child: Icon(Icons.close)))
          ]),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera, context);
                },
                icon: Icon(Icons.camera),
                label: Text('Camera'),
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery, context);
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
}
