import 'package:flutter/material.dart';
import 'package:tanipedia_mobile_app/shared/shared.dart';

class WrapField extends StatelessWidget {
  final Widget widget;
  WrapField(this.widget) : assert(widget != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: mainColor,
            width: 2.0,
          ),
        ),
        child: Container(child: widget),
      ),
    );
  }
}
