import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tanipedia_mobile_app/cubit/get_list_pupuk_cubit.dart';
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
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => CreateProfileCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => UploadPhotoProfileCubit()),
        BlocProvider(create: (_) => GetListPupukCubit())
      ],
      child: GetMaterialApp(
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: TestPage(),
        ),
      ),
    );
  }
}
