part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PickedFile _photoFile;
  final ImagePicker _imagePicker = ImagePicker();
  ProgressDialog progressDialog;

  Widget build(BuildContext context) {
    ProfileState state = context.watch<ProfileCubit>().state;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: defaultMargin),
        child: (state is ProfileInitial)
            ? loadingIndicator
            : ListView(
                padding: EdgeInsets.all(defaultMargin),
                children: [
                  imageProfile(context),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        (context.watch<ProfileCubit>().state as ProfileLoaded)
                            .profile
                            .nama,
                        style: blackFontBoldStyle2,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        (context.watch<ProfileCubit>().state as ProfileLoaded)
                            .profile
                            .telepon,
                        style: blackFontStyle3,
                      ),
                    ),
                  ),
                  WrapBorder(Text((state is ProfileLoaded)
                      ? 'Tanggal Lahir ${state.profile.tglLahir}'
                      : 'Tanggal Lahir belum diisi.')),
                  WrapBorder(Text((state is ProfileLoaded)
                      ? 'Kode Pos ${state.profile.kodepos}'
                      : 'Anda belum mengisi Kode Pos.')),
                  WrapBorder(Text((state is ProfileLoaded)
                      ? 'No.KK ${state.profile.kk}'
                      : 'Anda belum mengisi No.KK.')),
                  WrapBorder(Text((state is ProfileLoaded)
                      ? 'NIK ${state.profile.nik}'
                      : 'Anda belum mengisi NIK.')),

                  // WrapBorder(Text((state is ProfileLoaded)
                  //     ? state.profile.gender
                  //     : 'Kamu ga punya kelamin.')),
                  // WrapBorder(Text(
                  //     (state is ProfileLoaded) ? state.profile.agama : 'Ateis.')),
                  // WrapBorder(Text(
                  //     (state is ProfileLoaded) ? state.profile.golDarah : 'Mayat')),
                  // WrapBorder(Text((state is ProfileLoaded)
                  //     ? state.profile.suku
                  //     : 'Anda belum mengisi Suku.')),
                  // WrapBorder(Text((state is ProfileLoaded)
                  //     ? state.profile.pendidikan
                  //     : 'Anda belum mengisi Pendidikan Terakhir.')),

                  // WrapBorder(Text((state is ProfileLoaded)
                  //     ? state.profile.fotoKtp
                  //     : 'Anda belum mengupload foto KTP.')),
                  // WrapBorder(Text((state is ProfileLoaded)
                  //     ? state.profile.facebook
                  //     : 'Anda belum mengisi kelompok tani.')),
                ],
              ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(source: source);
    setState(() {
      _photoFile = pickedFile;
    });
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

  Widget imageProfile(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 120,
            width: 120,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: _photoFile == null
                  ? AssetImage("assets/ic_profile.png")
                  : FileImage(File(_photoFile.path)),
            ),
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
                    size: 30, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
