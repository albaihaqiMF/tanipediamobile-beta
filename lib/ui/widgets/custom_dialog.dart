part of 'widgets.dart';

class SuccessDialog extends StatelessWidget {
  final String title, description;
  final Image image;
  final Function onPress;

  SuccessDialog(
      {@required this.title,
      @required this.description,
      this.image,
      @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, onPress),
    );
  }

  dialogContent(BuildContext context, Function onPress) {
    return Stack(
      children: [
        Wrap(children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0)
                ]),
            child: Column(
              children: [
                Text(
                  title,
                  style: blackFontBoldStyle1,
                ),
                SizedBox(height: 24),
                Text(
                  description,
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                      onPressed: () => onPress(), child: Text('Konfirmasi')),
                )
              ],
            ),
          ),
        ]),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: accentColor,
            radius: 50,
            backgroundImage: AssetImage('assets/img_padi.jpg'),
          ),
        )
      ],
    );
  }
}

class FailedDialog extends StatelessWidget {
  final String title, description;
  final Image image;
  final Function onPress;

  FailedDialog(
      {@required this.title,
      @required this.description,
      this.image,
      @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, onPress),
    );
  }

  dialogContent(BuildContext context, Function onPress) {
    return Stack(
      children: [
        Wrap(children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0)
                ]),
            child: Column(
              children: [
                Text(
                  title,
                  style: blackFontBoldStyle1,
                ),
                SizedBox(height: 24),
                Text(
                  description,
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                      onPressed: () => onPress(), child: Text('Konfirmasi')),
                )
              ],
            ),
          ),
        ]),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: accentColor,
            radius: 50,
            backgroundImage: AssetImage('assets/img_padi.jpg'),
          ),
        )
      ],
    );
  }
}

class WarningDialog extends StatelessWidget {
  final String title, description;
  final Image image;
  final Function onPress;

  WarningDialog(
      {@required this.title,
      @required this.description,
      this.image,
      @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, onPress),
    );
  }

  dialogContent(BuildContext context, Function onPress) {
    return Stack(
      children: [
        Wrap(children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
            margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0)
                ]),
            child: Column(
              children: [
                Text(
                  title,
                  style: blackFontBoldStyle1,
                ),
                SizedBox(height: 24),
                Text(
                  description,
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                      onPressed: () => onPress(), child: Text('Konfirmasi')),
                )
              ],
            ),
          ),
        ]),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: CircleAvatar(
            backgroundColor: accentColor,
            radius: 50,
            backgroundImage: AssetImage('assets/img_padi.jpg'),
          ),
        )
      ],
    );
  }
}

class ConfirmDialog extends StatelessWidget {
  final String title, description;
  final Image image;
  final Function confirmPress, cancelPress;

  ConfirmDialog(
      {@required this.title,
      @required this.description,
      this.image,
      @required this.confirmPress,
      @required this.cancelPress});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, confirmPress, cancelPress),
    );
  }

  dialogContent(
      BuildContext context, Function confirmPress, Function cancelPress) {
    return Stack(
      children: [
        Wrap(children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 26, 16, 16),
            // margin: EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0)
                ]),
            child: Column(
              children: [
                Text(
                  title,
                  style: blackFontBoldStyle2,
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: blackFontStyle2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomButton(
                        text: 'Ya',
                        color: mainColor,
                        onPress: () => confirmPress(),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomButton(
                        text: 'Tidak',
                        color: Colors.red,
                        onPress: () => cancelPress(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ],
    );
  }
}
