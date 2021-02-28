part of '../pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  verifyUser() async {
    // Initial SharedPreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiToken = prefs.getString(KeySharedPreference.apiToken);

    // Get User
    await context.read<VerifyUserCubit>().verifyUser(apiToken);
    VerifyUserState state = context.read<VerifyUserCubit>().state;
    if (state is VerifyUserLoaded) {
      print('PAGE Splash : api_token : ${state.user.apiToken}');

      // Set DataUser to Local Storage
      prefs.setString(KeySharedPreference.idProfile, '246');
      prefs.setString(KeySharedPreference.apiToken, state.user.apiToken);
      apiToken = prefs.getString(KeySharedPreference.apiToken);
      print('PAGE Splash: token = $apiToken');

      // Get DataUser from Local Storage
      // final idProfile = prefs.getInt(KeySharedPreference.idProfile);

      // Get Data From Server
      await context.read<ProfileCubit>().getProfile(apiToken, '246');
      context.read<GetListPupukCubit>().getListPupuk(apiToken);
      context.read<GetPanenCubit>().getListPanen(apiToken);
      // Get.offAll(HomePage());
      Get.offAllNamed(AppRoutes.MAIN);
    } else if (state is VerifyUserFailed) {
      print('Splash : username ${state.message}');
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }

  @override
  void initState() {
    super.initState();
    verifyUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 170,
                height: 170,
                image: AssetImage('assets/logo_app.png'),
              ),
              Image(
                width: 200,
                height: 70,
                image: AssetImage('assets/text_app_white.png'),
              ),
              Text('Ver. 1.0', style: whiteFontStyle3)
            ],
          ),
        ),
      ),
    );
  }
}
