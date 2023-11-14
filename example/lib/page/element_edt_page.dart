import 'package:example/tool/json_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_layout/flutter_json_layout.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dart_json/smart_dart_json.dart';

/// 元素编辑页面 （目前只支持编辑文本元素）
class ElementEdtPage extends StatefulWidget {
  final TempBaseElement targetElement;

  const ElementEdtPage({
    Key? key,
    required this.targetElement,
  }) : super(key: key);

  static Future<TempBaseElement?> show(
    BuildContext context,
    TempBaseElement targetElement,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          child: ElementEdtPage(
            targetElement: targetElement,
          ),
        );
      },
    );
  }

  @override
  State<ElementEdtPage> createState() => _ElementEdtPageState();
}

class _ElementEdtPageState extends State<ElementEdtPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(
      text: widget.targetElement.toFormatJson(),
    );
    super.initState();
  }

  Widget _title() {
    return Container(
      height: 40.w,
      alignment: Alignment.center,
      padding: EdgeInsets.all(5.w),
      child: Text(
        "编辑选中元素",
        style: TextStyle(fontSize: 13.w),
      ),
    );
  }

  Widget _textField() {
    return LayoutBuilder(builder: (ct, cs) {
      return Container(
        constraints: BoxConstraints(
          minHeight: cs.maxHeight,
          maxHeight: cs.maxHeight,
        ),
        child: Center(
          child: TextField(
            maxLines: null,
            controller: _controller,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(12.w),
              filled: true,
              fillColor: Colors.grey,
              border: InputBorder.none,
            ),
          ),
        ),
      );
    });
  }

  Widget _buttonWidget(
    String title,
    VoidCallback onPressed,
  ) {
    return Container(
      padding: EdgeInsets.all(
        10.w,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 12.w),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 240.w,
      width: 287.w,
      child: Column(
        children: [
          _title(),
          Expanded(
            child: _textField(),
          ),
          _buttonWidget(
            '确定保存',
            () {
              final edtData = _controller.value.text;
              final jsonData = JsonTool.toJsonString(edtData);
              Navigator.of(context).pop(
                DynamicElementParseTool.buildTempElement(
                  SDartJson(
                    jsonData,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
