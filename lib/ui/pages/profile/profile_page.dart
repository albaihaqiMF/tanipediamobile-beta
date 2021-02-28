part of '../pages.dart';

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
    String _pathFoto = data.profile.fotoProfil;

    String _fotoProfil;
    if (_pathFoto != null) {
      _fotoProfil = ApiUrl.baseURL + _pathFoto.substring(8);
    }

    return Scaffold(
      key: scaffoldState,
      body: Container(
        child: (stateProfile is ProfileLoaded)
            ? ListView(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Profil Saya',
                        style: mainFontBoldStyle1,
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(Icons.notifications,
                              color: mainColor, size: 30),
                          onPressed: () {}),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        imageProfile(context, _fotoProfil, _updateFotoProfil),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (nama != null) ? nama : '-',
                                style: blackFontBoldStyle3,
                              ),
                              Text(
                                (noTelp != null) ? noTelp : '-',
                                style: blackFontStyle4,
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.BIODATA);
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              // Get.toNamed(AppRoutes.MY_INTEREST);
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(),
                              child: Container(
                                padding: EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Icon(Icons.assistant_photo_outlined,
                                        color: mainColor),
                                    SizedBox(width: 10),
                                    Text('Minat Saya', style: blackFontStyle2),
                                    Spacer(),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.ADDRESS);
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(),
                              child: Container(
                                padding: EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        color: mainColor),
                                    SizedBox(width: 10),
                                    Text('Alamat', style: blackFontStyle2),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.PROFILE_PERTANIAN);
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(),
                              child: Container(
                                padding: EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Icon(Icons.spa_outlined, color: mainColor),
                                    SizedBox(width: 10),
                                    Text('Profil Pertanian',
                                        style: blackFontStyle2),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.HELP);
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(),
                              child: Container(
                                padding: EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Icon(Icons.help_outline_rounded,
                                        color: mainColor),
                                    SizedBox(width: 10),
                                    Text('Bantuan', style: blackFontStyle2),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => ConfirmDialog(
                                      title: 'Konfirmasi',
                                      description:
                                          'Apakah Anda yakin ingin keluar?',
                                      confirmPress: () async {
                                        FirebaseAuth.instance.signOut();
                                        SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        prefs.clear();
                                        Get.offAll(LoginPage());
                                        // Get.back();
                                      },
                                      cancelPress: () {
                                        Get.back();
                                      }));
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(),
                              child: Container(
                                padding: EdgeInsets.all(14),
                                child: Row(
                                  children: [
                                    Icon(Icons.logout, color: Colors.red),
                                    SizedBox(width: 10),
                                    Text('Keluar', style: redBoldFontStyle2),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Center(child: Text('Data Profil Gagal dimuat')),
      ),
    );
  }

  void takePhoto(ImageSource source, BuildContext context) async {
    final _pickedFile = await _imagePicker.getImage(source: source);
    if (_pickedFile != null) {
      String imagePath = AppConverter.toBase64(_pickedFile);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final apiToken = prefs.getString(KeySharedPreference.apiToken);
      final idProfil = prefs.getString(KeySharedPreference.idProfile);
      showProgressDialog(context, 'Uploading file...');

      await context
          .read<UploadPhotoProfileCubit>()
          .uploadPhotoProfile(apiToken, idProfil, imagePath);
      Get.back();

      UploadPhotoProfileState state =
          context.read<UploadPhotoProfileCubit>().state;
      try {
        if (state is UploadPhotoProfileLoaded) {
          String _dataImage = state.profile.fotoProfil;
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
                        : AssetImage("assets/ic_profil.png"),
                  )
                : CircleAvatar(
                    radius: 80,
                    backgroundImage: imageUrl != null
                        ? NetworkImage(imageUrl)
                        : AssetImage("assets/ic_profil.png")),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: InkWell(
              onTap: () {
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
      height: 160,
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
