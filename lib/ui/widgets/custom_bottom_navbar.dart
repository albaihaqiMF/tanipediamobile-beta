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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    size: ((selectedIndex == 0) ? 35 : 25),
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
                  padding: EdgeInsets.only(top: 5),
                  child: Text((selectedIndex == 0)?'Beranda':'', style: mainFontBoldStyle3.copyWith(fontSize: 14),
                  ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.language_outlined,
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
                padding: EdgeInsets.only(top: 5),
                child: Text((selectedIndex == 1)?'Sosmed':'', style: mainFontBoldStyle3.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.chrome_reader_mode_outlined,
                    size: ((selectedIndex == 2) ? 35 : 25),
                    color: ((selectedIndex == 2) ? mainColor : Colors.grey),
                  ),
                  onPressed: () {
                    if (onTap != null) {
                      onTap(2);
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text((selectedIndex == 2)?'Belajar':'', style: mainFontBoldStyle3.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_basket_outlined,
                    size: ((selectedIndex == 3) ? 35 : 25),
                    color: ((selectedIndex == 3) ? mainColor : Colors.grey),
                  ),
                  onPressed: () {
                    if (onTap != null) {
                      onTap(3);
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text((selectedIndex == 3)?'Pasar & \nKeuangan':'', style: mainFontBoldStyle3.copyWith(fontSize: 14),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                child: IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    size: ((selectedIndex == 4) ? 35 : 25),
                    color: ((selectedIndex == 4) ? mainColor : Colors.grey),
                  ),
                  onPressed: () {
                    if (onTap != null) {
                      onTap(4);
                    }
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text((selectedIndex == 4)?'Profil':'', style: mainFontBoldStyle3.copyWith(fontSize: 14),
                  ),
              ),
            ],
          ),
          // Column(
          //
          //   children: [
          //     Container(
          //       width: 50,
          //       height: 50,
          //       child: IconButton(
          //         icon: Icon(
          //           Icons.home_outlined,
          //           size: ((selectedIndex == 0) ? 25 : 25),
          //           color: ((selectedIndex == 0) ? mainColor : Colors.grey),
          //         ),
          //         onPressed: () {
          //           if (onTap != null) {
          //             onTap(0);
          //           }
          //         },
          //       ),
          //     ),
          //     Text(
          //       'Beranda',
          //       style: TextStyle(fontSize: 10),
          //     ),
          //   ],
          // ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.language_outlined,
          //       size: ((selectedIndex == 1) ? 35 : 25),
          //       color: ((selectedIndex == 1) ? mainColor : Colors.grey),
          //     ),
          //     onPressed: () {
          //       if (onTap != null) {
          //         onTap(1);
          //       }
          //     },
          //   ),
          // ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.chrome_reader_mode_outlined,
          //       size: ((selectedIndex == 2) ? 35 : 25),
          //       color: ((selectedIndex == 2) ? mainColor : Colors.grey),
          //     ),
          //     onPressed: () {
          //       if (onTap != null) {
          //         onTap(2);
          //       }
          //     },
          //   ),
          // ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.shopping_basket_outlined,
          //       size: ((selectedIndex == 3) ? 35 : 25),
          //       color: ((selectedIndex == 3) ? mainColor : Colors.grey),
          //     ),
          //     onPressed: () {
          //       if (onTap != null) {
          //         onTap(3);
          //       }
          //     },
          //   ),
          // ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.person_outline,
          //       size: ((selectedIndex == 4) ? 35 : 25),
          //       color: ((selectedIndex == 4) ? mainColor : Colors.grey),
          //     ),
          //     onPressed: () {
          //       if (onTap != null) {
          //         onTap(4);
          //       }
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
