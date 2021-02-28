part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // String uid;
  // String name = Get.arguments[0];
  // String apiToken = Get.arguments[1];
  String apiToken, name;

  getLogedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    apiToken = prefs.getString(KeySharedPreference.apiToken);
    name = prefs.getString(KeySharedPreference.name);
    print('Home Page : $apiToken');
    print('Home Page : $name');
  }

  @override
  void initState() {
    super.initState();
    // uid = FirebaseAuth.instance.currentUser.uid;
    getLogedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        brightness: Brightness.light,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('UID : $uid'),
            Text('Name : $name'),
            Text('Token : $apiToken'),
            CustomButton(
                onPress: () async {
                  FirebaseAuth.instance.signOut();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  Get.offAll(LoginPage());
                },
                text: 'Logout',
                color: mainColor),
          ],
        ),
      ),
    );
  }
}
