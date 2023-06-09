import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ExWidget on Widget {
  Widget buildVisible(bool visible) {
    return Visibility(
      child: this,
      visible: visible,
    );
  }

  Widget align(AlignmentGeometry alignment) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget alignLeft() {
    return align(Alignment.centerLeft);
  }

  Widget alignRight() {
    return align(Alignment.centerRight);
  }

  Widget alignCenter() {
    return align(Alignment.center);
  }

  Widget padding({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  Widget withShadow({
    double marginLeft = 0,
    double marginTop = 0,
    double marginRight = 0,
    double marginBottom = 0,
    double blurRadius = 0,
    Color shadowColor = Colors.grey,
    Color bgColor = Colors.white,
    double offsetX = 0,
    double offsetY = 0,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: marginLeft,
        top: marginTop,
        right: marginRight,
        bottom: marginBottom,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(offsetX, offsetY),
            color: shadowColor,
            blurRadius: blurRadius,
            spreadRadius: 0,
          ),
        ],
        color: bgColor,
      ),
      child: this,
    );
  }

  Widget withContainerBorder({
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.w,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3.w)),
      ),
      child: this,
    );
  }
}
