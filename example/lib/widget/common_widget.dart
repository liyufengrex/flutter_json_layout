import 'package:example/ex/ex_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GroupTitle extends StatelessWidget {
  final String title;
  final int fontSize;

  const GroupTitle(
    this.title, {
    Key? key,
    this.fontSize = 11,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize.w,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class JsonContainer extends StatelessWidget {
  final String text;

  const JsonContainer(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        constraints: BoxConstraints(
            maxWidth: constraints.maxWidth,
            minWidth: constraints.maxWidth,
            minHeight: 160.w),
        color: Colors.white24,
        child: SelectableText(
          text,
          style: TextStyle(
            fontSize: 8.w,
            fontWeight: FontWeight.w100,
            color: Colors.grey,
            height: 2.0,
          ),
        ).withContainerBorder(
          padding: EdgeInsets.only(top: 10.w),
        ),
      );
    });
  }
}

class GroupWidget extends StatelessWidget {
  final List<Widget> children;

  const GroupWidget(this.children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}

class DescText extends StatelessWidget {
  final String text;
  final int fontSize;
  final Color fontColor;

  const DescText(
    this.text, {
    Key? key,
    this.fontSize = 7,
    this.fontColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(
        fontSize: fontSize.w,
        fontWeight: FontWeight.w200,
        color: fontColor,
      ),
    );
  }
}
