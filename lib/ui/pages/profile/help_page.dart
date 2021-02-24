part of '../pages.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                InkWell(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: mainColor,
                    )),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Bantuan',
                  style: mainFontBoldStyle1,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 80,
            width: double.infinity,
            child: InkWell(
              onTap: () {
                // Get.to(HelpPage());
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(),
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Icon(Icons.phone_outlined, color: mainColor),
                      SizedBox(width: 10),
                      Text('Pusat Bantuan', style: blackFontStyle2),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: InkWell(
              onTap: () {
                // Get.to(HelpPage());
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(),
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Icon(Icons.people_outline, color: mainColor),
                      SizedBox(width: 10),
                      Text('Tentang Kami', style: blackFontStyle2),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: InkWell(
              onTap: () {
                // Get.to(HelpPage());
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(),
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Icon(Icons.import_contacts_outlined, color: mainColor),
                      SizedBox(width: 10),
                      Text('Syarat dan Ketentuan', style: blackFontStyle2),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: InkWell(
              onTap: () {
                // Get.to(HelpPage());
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(),
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Icon(Icons.lock_outlined, color: mainColor),
                      SizedBox(width: 10),
                      Text('Privasi', style: blackFontStyle2),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: InkWell(
              onTap: () {
                // Get.to(HelpPage());
              },
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(),
                child: Container(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Icon(Icons.warning_amber_outlined, color: mainColor),
                      SizedBox(width: 10),
                      Text('Laporan Masalah', style: blackFontStyle2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
