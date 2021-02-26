import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanipedia_mobile_app/cubit/cubit.dart';
import 'package:tanipedia_mobile_app/cubit/pupuk/get_list_pupuk_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/profile_cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/upload_photo_profile_cubit.dart';
import 'package:tanipedia_mobile_app/local_storage/shared_preference.dart';
import 'package:tanipedia_mobile_app/model/dropdown/dropdowns.dart';
import 'package:tanipedia_mobile_app/network/api_url.dart';
import 'package:tanipedia_mobile_app/routes/app_routes.dart';
import 'package:tanipedia_mobile_app/shared/shared.dart';
import 'package:tanipedia_mobile_app/ui/pages/pages.dart';
import 'package:tanipedia_mobile_app/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as cubit;

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String imagePath;

  PickedFile _photoFile;
  final ImagePicker _imagePicker = ImagePicker();
  Desa selectedItem;
  String fotoProfil =
      'https://assets.pikiran-rakyat.com/crop/3x282:688x907/x/photo/2020/10/10/2212111952.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageProfile(context, fotoProfil),
          Text((selectedItem != null)
              ? selectedItem.name
              : "Anda belum memilih"),
          CustomButton(
              onPress: () async {
                SharedPreferences sf = await SharedPreferences.getInstance();
                sf.setInt(KeySharedPreference.idProfile, 180);
                final iddProfile = sf.getInt(KeySharedPreference.idProfile);
                await context.bloc<ProfileCubit>().getProfile('243');

                Get.to(ProfilePage());
              },
              text: 'to Profile Page',
              color: mainColor),
          CustomButton(
              onPress: () {
                Get.off(CreateProfilePage(),
                    arguments: ['1147', '+628985953469']);
              },
              text: 'Create Profile',
              color: mainColor),
          CustomButton(
              onPress: () {
                context.bloc<GetListPupukCubit>().getListPupuk();
                Get.to(ListPupukPage());
              },
              text: 'To List Pupuk',
              color: mainColor),
          CustomButton(
              onPress: () {
                // context.bloc<GetListLahanCubit>().getListLahan();
                Get.to(ListLahanPage());
              },
              text: 'To List Lahan',
              color: mainColor),
          CustomButton(
              onPress: () {
                Get.toNamed(AppRoutes.CREATE_LAHAN);
              },
              text: 'To Created Lahan',
              color: mainColor),
          CustomButton(
              onPress: () {
                Get.to(ListPanenPage());
              },
              text: 'ToListPanen',
              color: mainColor),
          CustomButton(
              onPress: () {
                Get.off(RegisterPage());
              },
              text: 'To Register',
              color: Colors.yellow),
          CustomButton(
              onPress: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => SuccessDialog(
                          title: 'Succes',
                          description: 'Anda berhasil menambahkan lahan',
                          onPress: () => Get.offAll(CreateLahanPage()),
                        ));
              },
              text: 'Dialog Tes',
              color: mainColor),
          CustomButton(
              onPress: () {
                showDialog(
                    context: context,
                    builder: (context) => ConfirmDialog(
                        title: 'asd',
                        description: 'asd',
                        confirmPress: () {
                          Get.back();
                        },
                        cancelPress: () {
                          Get.back();
                        }));
              },
              text: 'Confirm Dialog Tes',
              color: mainColor),
          CustomButton(
              onPress: () => Get.to(SplashPage()),
              text: 'Splash',
              color: mainColor),
          CustomButton(
              onPress: () => Get.offAll(
                    DashboardPage(),
                    arguments: ['123', 'token', 'Nanda'],
                  ),
              text: 'Dashboard',
              color: mainColor),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.getImage(source: source);

    // setState(() {
    //   _photoFile = pickedFile;

    //   // Upload
    //   // imagePath = AppConverter.toBase64(_photoFile);
    // });

    String imagePath = AppConverter.toBase64(pickedFile);
    showProgressDialog(context);
    print('EDIT Foto Profile : Path = $imagePath');
    await context
        .read<UploadPhotoProfileCubit>()
        .uploadPhotoProfile(164, imagePath);
    showProgressDialog(context);

    Get.back();

    UploadPhotoProfileState state =
        context.bloc<UploadPhotoProfileCubit>().state;
    if (state is UploadPhotoProfileLoaded) {
      try {
        String fotoAPI = (context.bloc<UploadPhotoProfileCubit>().state
                as UploadPhotoProfileLoaded)
            .profile
            .fotoProfil;
        String imageAPI = ApiUrl.baseURL + fotoAPI;
        setState(() {
          fotoProfil = '$imageAPI';
        });
        dismissProgressDialog(context);
      } catch (e) {
        print('GAGAL masang foto ${e.toString()}');
        dismissProgressDialog(context);
      }
    }
  }

  Widget imageProfile(BuildContext context, imageUrl) {
    return Container(
      child: Center(
        child: Stack(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: imageUrl != null
                  ? NetworkImage(imageUrl)
                  : AssetImage("assets/ic_profile.png"),
              // backgroundImage: _photoFile == null
              //     ? AssetImage("assets/ic_profile.png")
              //     : FileImage(File(_photoFile.path)),
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
}
