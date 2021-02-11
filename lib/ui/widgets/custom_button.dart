part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Function onPress;
  final String text;
  final double height;
  final double width;

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
          side: BorderSide(
            color: mainColor,
            width: 2.0,
          ),
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
