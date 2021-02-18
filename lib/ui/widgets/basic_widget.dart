part of 'widgets.dart';

void showToast(BuildContext context, String message) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text('$message'),
      action: SnackBarAction(
          label: 'CLOSE', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

void showSnackbar(String title, String message) {
  Get.snackbar(
    "",
    "",
    backgroundColor: accentColor,
    icon: Icon(
      MdiIcons.closeCircleOutline,
      color: Colors.white,
    ),
    titleText: Text(
      title,
      style: blackFontBoldStyle3,
    ),
    messageText: Text(
      message,
      style: blackFontStyle3,
    ),
  );
}

Widget loadingIndicator = SpinKitFadingCircle(size: 45, color: mainColor);

customCard(BuildContext context,
    {Function onPress, IconData icons, double height, double width}) {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(width: 0, color: Colors.grey)),
    child: InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(15),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(margin: EdgeInsets.all(5), child: Icon(icons)),
          ],
        ),
      ),
    ),
  );
}
