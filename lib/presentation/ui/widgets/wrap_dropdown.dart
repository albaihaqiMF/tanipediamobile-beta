part of 'widgets.dart';

Widget wrapDropdown(Widget dropdown) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: mainColor,
          width: 1.5,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButtonHideUnderline(child: dropdown),
      ),
    ),
  );
}
