part of 'widgets.dart';

void showProgressDialog(BuildContext context, String message) async {
  ProgressDialog pr = ProgressDialog(context);
  pr = ProgressDialog(
    context,
    type: ProgressDialogType.Normal,
    isDismissible: false,
    showLogs: true,
  );
  pr.style(
      message: message,
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 8.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600));
  await pr.show();
}

void updateProgressDialog(BuildContext context) async {
  ProgressDialog pr = ProgressDialog(context);
  pr = ProgressDialog(context,
      type: ProgressDialogType.Download, isDismissible: false, showLogs: true);
  pr.update(
    progress: 50.0,
    message: "Please wait...",
    progressWidget: Container(
        padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
    maxProgress: 100.0,
    progressTextStyle: TextStyle(
        color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
    messageTextStyle: TextStyle(
        color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
  );
}

void dismissProgressDialog(BuildContext context) async {
  ProgressDialog pr = ProgressDialog(context);
  pr = ProgressDialog(context,
      type: ProgressDialogType.Download, isDismissible: false, showLogs: true);
  await pr.hide();
}
