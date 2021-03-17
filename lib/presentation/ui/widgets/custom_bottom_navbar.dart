part of 'widgets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;

  CustomBottomNavBar({this.selectedIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 5),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildItem('Beranda', Icons.home_outlined, 0),
          buildItem('Sosmed', Icons.language_outlined, 1),
          buildItem('Belajar', Icons.chrome_reader_mode_outlined, 2),
          buildItem('Pasar', Icons.monetization_on_outlined, 3),
          buildItem('Keuangan', Icons.shopping_basket_outlined, 4),
          buildItem('Profil', Icons.person_outline, 5)
        ],
      ),
    );
  }

  Widget buildItem(String name, IconData icon, int index) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(index);
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: ((selectedIndex == index) ? 35 : 25),
            color: ((selectedIndex == index) ? mainColor : Colors.grey),
          ),
          Text(name,
              style: (selectedIndex == index)
                  ? mainFontBoldStyle3.copyWith(fontSize: 10)
                  : greyFontStyle.copyWith(fontSize: 10))
        ],
      ),
    );
  }
}
