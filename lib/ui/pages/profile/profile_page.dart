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
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => CommingSoonDialog());
                          }),
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
                                LinearPercentIndicator(
                                  width: 200.0,
                                  lineHeight: 10.0,
                                  percent: 1,
                                  linearStrokeCap: LinearStrokeCap.roundAll,
                                  backgroundColor: Colors.grey[300],
                                  progressColor: mainColor,
                                ),
                              SizedBox(height: 5),
                              Text(
                                'Kelengkapan Profil Anda 100%',
                                style: TextStyle(color: Colors.amber[800], fontSize: 12, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        // Spacer(),
                        // InkWell(
                        //     onTap: () {
                        //       Get.toNamed(AppRoutes.BIODATA);
                        //     },
                        //     child: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.BIODATA);
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Icon(Icons.assignment_ind_outlined,
                                  color: mainColor),
                              SizedBox(width: 10),
                              Text('Data Diri', style: blackFontStyle2),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                      ),
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
                              showDialog(
                                  context: context,
                                  builder: (context) => CommingSoonDialog());
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
                              showDialog(
                                  context: context,
                                  builder: (context) => CommingSoonDialog());
                              // Get.toNamed(AppRoutes.PROFILE_PERTANIAN);
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
                  SizedBox(height:60),
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
      final idProfil = prefs.getInt(KeySharedPreference.idProfile);
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
                // Get.bottomSheet(Container());
                getBottomSheet(context);
                // scaffoldState.currentState
                //     .showBottomSheet((context) => bottomSheet(context));
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

  Future<dynamic> getBottomSheet(BuildContext context){
    return Get.bottomSheet(
      Container(
        margin: EdgeInsets.all(defaultMargin),
        height: 160,
        child:Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Text('Pilih foto profil', style: blackFontBoldStyle3)),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [
                  InkWell(
                    onTap:()=>takePhoto(ImageSource.camera, context),
                    child: Container(
                        height:40,
                        width:40,
                        child: Image(image:AssetImage('assets/ic_camera.png'))),
                  ),
                  Text('Camera', style:blackFontStyle3),
                ],),

                Column(children: [
                  InkWell(
                    onTap:()=>takePhoto(ImageSource.gallery, context),
                    child: Container(
                        height:40,
                        width:40,
                        child: Image(image:AssetImage('assets/ic_gallery.png'))),
                  ),
                  Text('Gallery', style:blackFontStyle3),
                ],),
              ],
            ),
            SizedBox(height: 10),
            CustomButton(color: mainColor,onPress: ()=>Get.back(),text: 'Batal',),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
      side:BorderSide(
        color:Colors.white,
        style:BorderStyle.solid,
        width:2.0,
      ),)
    );
  }
}
