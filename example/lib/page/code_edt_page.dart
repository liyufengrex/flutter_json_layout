import 'package:example/ex/ex_widget.dart';
import 'package:example/page/element_edt_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_layout/flutter_json_layout.dart';
import '../widget/json_layout_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 源码编辑页面
class CodeEdtPage extends StatelessWidget {
  final String initialJsonTemp;
  final String initialData;

  const CodeEdtPage({
    Key? key,
    required this.initialJsonTemp,
    required this.initialData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Json Layout（编辑示例）',
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: _CodeEdtPage(
        initialJsonTemp: initialJsonTemp,
        initialData: initialData,
      ),
    );
  }
}

class _CodeEdtPage extends StatefulWidget {
  final String initialJsonTemp;
  final String initialData;

  const _CodeEdtPage({
    Key? key,
    required this.initialJsonTemp,
    required this.initialData,
  }) : super(key: key);

  @override
  State<_CodeEdtPage> createState() => _CodeEdtPageState();
}

class _CodeEdtPageState extends State<_CodeEdtPage> {
  late TextEditingController _jsonController;
  late TextEditingController _dataController;

  @override
  void initState() {
    super.initState();
    _jsonController = TextEditingController(text: widget.initialJsonTemp);
    _dataController = TextEditingController(text: widget.initialData);
  }

  Widget _textField({
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      children: [
        Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
          alignment: Alignment.centerLeft,
          child: Text(hint),
        ),
        Expanded(
          child: TextField(
            maxLines: null,
            controller: controller,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(10.w),
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
        )
      ],
    ).withContainerBorder();
  }

  Widget _convertButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          setState(() {});
        },
        child: const Text('修改后可点击渲染 >>'),
      ),
    );
  }

  //元素选中编辑
  void onElementSelectEdit(
    DynamicTempModel originTemp,
    TempBaseElement targetElement,
  ) {
    ElementEdtPage.show(context, targetElement).then((newElement) {
      if (newElement != null) {
        final temp = originTemp.replaceElement(newElement);
        setState(() {
          _jsonController.text = temp.toFormatJson();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 60.w,
        vertical: 20.w,
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(
                child: _textField(
                  hint: 'JSON Layout',
                  controller: _jsonController,
                ),
              ),
              SizedBox(height: 10.w),
              _convertButton(),
              SizedBox(height: 10.w),
              Expanded(
                child: _textField(
                  hint: 'Data',
                  controller: _dataController,
                ),
              ),
            ],
          )),
          SizedBox(width: 15.w),
          Expanded(
            child: Center(
              // 为了显示出最终打印的尺寸
              child: Transform.scale(
                scale: 1 / 1.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      JsonLayoutWidget(
                        jsonString: _jsonController.value.text,
                        jsonData: _dataController.value.text,
                        onElementSelectTap: onElementSelectEdit,
                      ).withShadow(
                        blurRadius: 2.5,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
