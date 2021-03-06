part of 'pages.dart';

class Test2Page extends StatelessWidget {
  final SharedPreferences prefs = sl<SharedPreferences>();
  @override
  Widget build(BuildContext context) {
    // print('SINGLETON : ${identical(prefs, sharedPreferences)}');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              onPress: () async {
                String apiToken = prefs.getString(KeySharedPreference.apiToken);
                int idProfile = prefs.getInt(KeySharedPreference.idProfile);
                await context
                    .read<GetProfileCubit>()
                    .getProfile(apiToken, idProfile);
              },
              text: 'Cache Data Profile',
              color: mainColor),
          CustomButton(
            text: 'Delete SQFlite',
            color: mainColor,
            onPress: () async {
              ProfileDao dao = sl<ProfileDao>();
              await dao.deleteAll();
            },
          )
        ],
      ),
    );
  }
}
