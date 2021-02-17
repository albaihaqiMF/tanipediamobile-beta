part of 'widgets.dart';

class WrapBorder extends StatelessWidget {
  final Widget widget;
  final Color color;
  WrapBorder(this.widget, {this.color}) : assert(widget != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 3,
        shape: (color == null)
            ? null
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0),
                side: BorderSide(
                  color: color,
                  width: 2.0,
                ),
              ),
        child: Container(padding: EdgeInsets.all(14), child: widget),
      ),
    );
  }
}
