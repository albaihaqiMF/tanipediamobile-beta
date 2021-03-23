import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getX;
import 'package:tanipedia_mobile_app/presentation/cubit/profile/update_profile_cubit.dart';
import 'package:tanipedia_mobile_app/injection_container.dart';
import 'package:tanipedia_mobile_app/core/routes/app_pages.dart';
import 'package:tanipedia_mobile_app/core/shared/shared.dart';
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
        BlocProvider(create: (_) => sl<LoginCubit>()),
        BlocProvider(create: (_) => sl<VerifyUserCubit>()),
        // Register
        BlocProvider(create: (_) => sl<UpdateUserCubit>()),
        BlocProvider(create: (_) => sl<RegisterCubit>()),
        // Profile
        BlocProvider(create: (_) => sl<CreateProfileCubit>()),
        BlocProvider(create: (_) => sl<GetProfileCubit>()),
        BlocProvider(create: (_) => sl<UploadPhotoProfileCubit>()),
        BlocProvider(create: (_) => sl<UpdateProfileCubit>()),
        // Pupuk
        BlocProvider(create: (_) => sl<GetListPupukCubit>()),
        BlocProvider(create: (_) => sl<DetailPupukCubit>()),
        // Lahan
        BlocProvider(create: (_) => sl<GetDetailLahanCubit>()),
        BlocProvider(create: (_) => sl<GetListLahanCubit>()),
        BlocProvider(create: (_) => sl<CreateLahanCubit>()),
        BlocProvider(create: (_) => sl<DeleteLahanCubit>()),
        BlocProvider(create: (_) => sl<UpdateLahanCubit>()),
        // Panen
        BlocProvider(create: (_) => sl<CreatePanenCubit>()),
        BlocProvider(create: (_) => sl<GetListPanenCubit>()),
        BlocProvider(create: (_) => sl<GetDetailPanenCubit>()),
        BlocProvider(create: (_) => sl<DeletePanenCubit>()),
        BlocProvider(create: (_) => sl<UpdatePanenCubit>()),
        // Wilayah
        BlocProvider(create: (_) => sl<ProvinsiCubit>()),
        BlocProvider(create: (_) => sl<KabupatenCubit>()),
        BlocProvider(create: (_) => sl<KecamatanCubit>()),
        BlocProvider(create: (_) => sl<DesaCubit>()),
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
