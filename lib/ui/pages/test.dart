import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tanipedia_mobile_app/cubit/cubit.dart';
import 'package:tanipedia_mobile_app/cubit/profile/profile_cubit.dart';
import 'package:tanipedia_mobile_app/local_storage/shared_preference.dart';
import 'package:tanipedia_mobile_app/routes/app_routes.dart';
import 'package:tanipedia_mobile_app/shared/shared.dart';
import 'package:tanipedia_mobile_app/ui/pages/pages.dart';
import 'package:tanipedia_mobile_app/ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String imagePath;

  String fotoProfil =
      'https://assets.pikiran-rakyat.com/crop/3x282:688x907/x/photo/2020/10/10/2212111952.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // imageProfile(context, fotoProfil),
          CustomButton(
              onPress: () async {
                SharedPreferences sf = await SharedPreferences.getInstance();
                sf.setInt(KeySharedPreference.idProfile, 234);
                final idProfile = sf.getInt(KeySharedPreference.idProfile);
                await context
                    .read<ProfileCubit>()
                    .getProfile(idProfile.toString());

                Get.to(ProfilePage());
              },
              text: 'to Profile Page',
              color: mainColor),
          CustomButton(
              onPress: () {
                Get.to(CreateProfilePage(),
                    arguments: ['1147', '+628985953469']);
              },
              text: 'Create Profile',
              color: mainColor),
          CustomButton(
              onPress: () {
                Get.to(ListPupukPage());
              },
              text: 'To List Pupuk',
              color: mainColor),
          CustomButton(
              onPress: () {
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
          CustomButton(
              onPress: () {
                showProgressDialog(context, 'Test...');
                Future<void> delay() async {
                  await Future.delayed(Duration(milliseconds: 3000));

                  dismissProgressDialog(context);
                }

                delay();
              },
              text: 'Show ProgressDialog',
              color: mainColor),
          CustomButton(
              onPress: () {
                dismissProgressDialog(context);
              },
              text: 'Show ProgressDialog',
              color: mainColor),
        ],
      ),
    );
  }
}
