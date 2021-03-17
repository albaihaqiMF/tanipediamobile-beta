import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getX;
import 'package:tanipedia_mobile_app/presentation/cubit/profile/update_profile_cubit.dart';
import 'package:tanipedia_mobile_app/injection_container.dart';
import 'package:tanipedia_mobile_app/core/routes/app_pages.dart';
import 'package:tanipedia_mobile_app/presentation/shared/shared.dart';
import 'presentation/cubit/cubit.dart';
import 'presentation/ui/pages/pages.dart';
import 'injection_container.dart' as di;

void main() async {
  // Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();

  // Set Statusbar Default
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.green,
    statusBarColor: mainColor, // status bar color
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
        BlocProvider(create: (_) => UpdateUserCubit()),
        BlocProvider(create: (_) => RegisterCubit()),
        BlocProvider(create: (_) => sl<CreateProfileCubit>()),
        // Profile
        BlocProvider(create: (_) => sl<GetProfileCubit>()),
        BlocProvider(create: (_) => sl<UploadPhotoProfileCubit>()),
        BlocProvider(create: (_) => sl<UpdateProfileCubit>()),
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
        ),
      ),
    );
  }
}
