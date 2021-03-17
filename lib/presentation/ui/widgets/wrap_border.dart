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

class WrapBorderCircle extends StatelessWidget {
  final Widget child;
  final Color color;
  WrapBorderCircle({this.child, this.color}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
