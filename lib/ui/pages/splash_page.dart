part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    return new Timer(Duration(seconds: 2), () async {
      // Initial SharedPreference
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // Set DataUser to Local Storage
      sharedPreferences.setInt(KeySharedPreference.idProfile, 180);
      sharedPreferences.setString(
          KeySharedPreference.name, 'Nanda Kista Permana');

      // Get DataUser from Local Storage
      final iddProfile =
          sharedPreferences.getInt(KeySharedPreference.idProfile);

      // Get Data From Server
      await context.read<ProfileCubit>().getProfile('$iddProfile');
      context.read<GetListPupukCubit>().getListPupuk();
      context.read<GetPanenCubit>().getListPanen();
      Get.offAllNamed(AppRoutes.MAIN);
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
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
