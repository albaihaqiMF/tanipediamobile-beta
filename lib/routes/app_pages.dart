import 'package:get/get.dart';
import 'package:tanipedia_mobile_app/ui/pages/pages.dart';
import 'package:tanipedia_mobile_app/ui/pages/test.dart';
import 'app_routes.dart';

// ignore: non_constant_identifier_names
AppPages() => [
      GetPage(
          name: AppRoutes.TEST,
          page: () => TestPage(),
          transition: Transition.rightToLeft,
          transitionDuration: Duration(seconds: 1)),
      GetPage(name: AppRoutes.MAIN, page: () => MainPage()),
      GetPage(name: AppRoutes.INITIAL, page: () => SplashPage()),
      GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
      GetPage(name: AppRoutes.REGISTER, page: () => RegisterPage()),
      GetPage(name: AppRoutes.OTP, page: () => AuthPage()),
      GetPage(
          name: AppRoutes.CREATE_PROFILE_PAGE1,
          page: () => CreateProfilePage()),
      GetPage(
          name: AppRoutes.CREATE_PROFILE_PAGE2,
          page: () => CreateProfilePage2()),
      GetPage(
          name: AppRoutes.CREATE_PROFILE_PAGE3,
          page: () => CreateProfilePage3()),

      // Profile
      GetPage(name: AppRoutes.PROFILE, page: () => ProfilePage()),
      GetPage(name: AppRoutes.BIODATA, page: () => BiodataPage()),
      GetPage(name: AppRoutes.HELP, page: () => HelpPage()),
      GetPage(name: AppRoutes.ADDRESS, page: () => AddressPage()),
      GetPage(name: AppRoutes.MY_INTEREST, page: () => InterestPage()),
      GetPage(
          name: AppRoutes.PROFILE_PERTANIAN, page: () => ProfilePertanian()),

      // Panen
      GetPage(name: AppRoutes.PANEN, page: () => ListPanenPage()),
      GetPage(name: AppRoutes.DETAIL_PANEN, page: () => DetailPanenPage()),

      // Pupuk
      GetPage(name: AppRoutes.PUPUK, page: () => ListPupukPage()),
      GetPage(name: AppRoutes.DETAIL_PUPUK, page: () => DetailPupukPage()),

      // Lahan
      GetPage(name: AppRoutes.LAHAN, page: () => ListLahanPage()),
      GetPage(name: AppRoutes.DETAIL_LAHAN, page: () => DetailLahanPage()),
      GetPage(name: AppRoutes.CREATE_LAHAN, page: () => CreateLahanPage()),

      //// Add Routes
      // GetPage(name: '/end_point', page: () => YourPage(), transition: Transition.fadeIn, transitionDuration: Duration(milliseconds: 1000)),
    ];
