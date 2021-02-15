part of 'widgets.dart';

class WrapBorder extends StatelessWidget {
  final Widget widget;
  WrapBorder(this.widget) : assert(widget != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: mainColor,
            width: 2.0,
          ),
        ),
        child: Container(padding: EdgeInsets.all(14), child: widget),
      ),
    );
  }
}
