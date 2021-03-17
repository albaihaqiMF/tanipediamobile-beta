part of 'widgets.dart';

class BasicCard extends StatelessWidget {
  final Widget child;
  BasicCard({this.child});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(padding: const EdgeInsets.all(10.0), child: child),
    );
  }
}
