part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final Color color, textColor;
  final Function onPress;
  final String text;
  final double height, width;

  CustomButton(
      {@required this.onPress,
      @required this.text,
      @required this.color,
      this.textColor = Colors.white,
      this.height = 50,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          // side: BorderSide(
          //   color: mainColor,
          //   width: 2.0,
          // ),
        ),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            onPress();
          },
          color: color,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final Color color, iconColor, textColor;
  final Function onPress;
  final String text;
  final double height, width;
  final IconData icon;

  CustomButton2(
      {@required this.onPress,
      @required this.text,
      this.textColor = Colors.white,
      this.color,
      @required this.icon,
      this.iconColor = Colors.white,
      this.height = 50,
      this.width = 140});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: InkWell(
        radius: 12,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: onPress,
        child: Card(
            color: (color != null) ? color : mainColor,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                SizedBox(width: 10),
                Text(text, style: TextStyle(color: textColor))
              ],
            )),
      ),
    );
  }
}
