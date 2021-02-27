part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavBar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      // color: Colors.white,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(3, 1),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 50,
            height: 50,
            child: IconButton(
              icon: Icon(
                Icons.home_outlined,
                size: ((selectedIndex == 0) ? 40 : 30),
                color: ((selectedIndex == 0) ? mainColor : Colors.grey),
              ),
              onPressed: () {
                if (onTap != null) {
                  onTap(0);
                }
              },
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: IconButton(
              icon: Icon(
                Icons.chrome_reader_mode_outlined,
                size: ((selectedIndex == 1) ? 35 : 25),
                color: ((selectedIndex == 1) ? mainColor : Colors.grey),
              ),
              onPressed: () {
                if (onTap != null) {
                  onTap(1);
                }
              },
            ),
          ),
          Container(
            width: 50,
            height: 50,
            child: IconButton(
              icon: Icon(
                Icons.person_outline,
                size: ((selectedIndex == 2) ? 40 : 30),
                color: ((selectedIndex == 2) ? mainColor : Colors.grey),
              ),
              onPressed: () {
                if (onTap != null) {
                  onTap(2);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
