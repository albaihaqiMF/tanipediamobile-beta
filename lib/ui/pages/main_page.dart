part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  DateTime backButtonPressedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        DoubleBackToCloseApp(
          snackBar: SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
            content: Text('Tap sekali lagi untuk keluar.', textAlign: TextAlign.center),),
          child: Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              SafeArea(
                  child: Container(
                color: 'FAFAFC'.toColor(),
              )),
              SafeArea(
                  child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                },
                children: [
                  Center(
                    child: DashboardPage(),
                  ),
                  Center(
                    child: ComingSoonPage(),
                  ),
                  Center(
                    child: ComingSoonPage(),
                  ),
                  Center(
                    child: ComingSoonPage(),
                  ),
                  Center(
                    child: ProfilePage(),
                  ),
                ],
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomBottomNavBar(
                  selectedIndex: selectedPage,
                  onTap: (index) {
                    setState(() {
                      selectedPage = index;
                    });
                    pageController.jumpToPage(selectedPage);
                  },
                ),
              )
            ],
          ),
        ),
    );
  }
}
