part of '../pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  verifyUser() async {
    // Initial SharedPreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    String apiToken = prefs.getString(KeySharedPreference.apiToken);
    print('PAGE Splash: token = $apiToken');

    // Get User
    await context.read<VerifyUserCubit>().verifyUser(apiToken);
    VerifyUserState state = context.read<VerifyUserCubit>().state;
    if (state is VerifyUserLoaded) {
      if(state.user.idProfile != null) {
        // Set DataUser to Local Storage
        prefs.setInt(KeySharedPreference.idProfile, state.user.idProfile);
        prefs.setString(KeySharedPreference.apiToken, state.user.apiToken);
        // Get Data From Server
        await context.read<GetProfileCubit>().getProfile(apiToken, state.user.idProfile);
        // Navigate Apps
        Get.offAllNamed(AppRoutes.MAIN);
      } else {
        Get.offAllNamed(AppRoutes.LOGIN);
      }
    } else if (state is VerifyUserFailed) {
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
