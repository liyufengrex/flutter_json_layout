import 'package:example/ex/ex_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroupTitle extends StatelessWidget {
  final String title;
  final int fontSize;
  final FontWeight fontWeight;

  const GroupTitle(
    this.title, {
    Key? key,
    this.fontSize = 11,
    this.fontWeight = FontWeight.w500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize.w,
        fontWeight: fontWeight,
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

class HomeGroupWidget extends StatelessWidget {
  final int flex;
  final String title;
  final String desc;
  final List<Widget> items;

  const HomeGroupWidget({
    Key? key,
    this.flex = 1,
    required this.title,
    required this.desc,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Colors.grey,
                  blurRadius: 3.5,
                  spreadRadius: 1,
                ),
              ],
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10.w,
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GroupTitle(title, fontWeight: FontWeight.w600, fontSize: 20),
                SizedBox(height: 8.w),
                Divider(height: 2.w, thickness: 1.w, color: Colors.grey),
                SizedBox(height: 8.w),
                DescText(desc, fontSize: 11, fontColor: Colors.black54),
                SizedBox(height: 10.w),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
