import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getX;
import 'package:tanipedia_mobile_app/routes/app_pages.dart';
import 'package:tanipedia_mobile_app/shared/shared.dart';
import 'package:tanipedia_mobile_app/ui/pages/test.dart';
import 'cubit/cubit.dart';
import 'ui/pages/pages.dart';

void main() async {
  // Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Set Statusbar Default
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.green,
    statusBarColor: Colors.white, // status bar color
    statusBarBrightness: Brightness.dark, //status bar brigtness
    statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Auth
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => VerifyUserCubit()),
        // Register
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => CreateProfileCubit()),
        // Profile
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => UploadPhotoProfileCubit()),
        // Pupuk
        BlocProvider(create: (_) => GetListPupukCubit()),
        BlocProvider(create: (_) => DetailPupukCubit()),
        // Lahan
        BlocProvider(create: (_) => GetDetailLahanCubit()),
        BlocProvider(create: (_) => GetListLahanCubit()),
        BlocProvider(create: (_) => CreateLahanCubit()),
        BlocProvider(create: (_) => DeleteLahanCubit()),
        BlocProvider(create: (_) => UpdateLahanCubit()),
        // Panen
        BlocProvider(create: (_) => CreatePanenCubit()),
        BlocProvider(create: (_) => GetPanenCubit()),
        BlocProvider(create: (_) => GetDetailPanenCubit()),
        BlocProvider(create: (_) => DeletePanenCubit()),
        BlocProvider(create: (_) => UpdatePanenCubit()),
        // Wilayah
        BlocProvider(create: (_) => ProvinsiCubit()),
        BlocProvider(create: (_) => KabupatenCubit()),
        BlocProvider(create: (_) => KecamatanCubit()),
        BlocProvider(create: (_) => DesaCubit()),
      ],
      child: getX.GetMaterialApp(
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        // initialRoute: AppRoutes.INITIAL,
        getPages: AppPages(),
        home: Scaffold(
          // body: TestPage(),
          body: SplashPage(),
          // body: MainPage(),
        ),
      ),
    );
  }
}
