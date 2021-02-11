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

class BuildProgressDialog extends StatelessWidget {
  final String loadingMessage;
  final ProgressDialog progressDialog;
  final bool show;
  const BuildProgressDialog(
      {this.loadingMessage, this.progressDialog, this.show});

  @override
  Widget build(BuildContext context) {
    final progressDialog =
        ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
      message: loadingMessage,
      progressWidget: Container(
          padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(color: Colors.black, fontSize: 14.0),
    );
    // progressDialog.show();
    if (show == false) {
      progressDialog.hide();
    } else {
      progressDialog.show();
    }
    return Container();
  }
}

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
