import 'package:example/ex/ex_widget.dart';
import 'package:example/test/test_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../api/api_config.dart';
import '../widget/common_widget.dart';
import '../widget/json_layout_widget.dart';

class ApiDetailPage extends StatelessWidget {
  final ApiEnum apiEnum;

  const ApiDetailPage({
    Key? key,
    required this.apiEnum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            apiEnum.titleDesc,
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: Container(
        color: Colors.white38,
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 30.w,
        ),
        child: _ContentWidget(apiEnum: apiEnum),
      ),
    );
  }
}

class _ContentWidget extends StatelessWidget {
  final ApiEnum apiEnum;

  const _ContentWidget({
    Key? key,
    required this.apiEnum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupWidget([
          const GroupTitle('示例'),
          SizedBox(height: 10.w),
          JsonContainer(apiEnum.example),
        ]),
        SizedBox(width: 10.w),
        GroupWidget([
          const GroupTitle('支持的属性'),
          SizedBox(height: 10.w),
          JsonContainer(apiEnum.supportArr),
        ]),
        SizedBox(width: 10.w),
        GroupWidget([
          const GroupTitle('绘制示例'),
          _DemoWidget(apiEnum.example),
        ]),
      ],
    );
  }
}

class _DemoWidget extends StatelessWidget {
  final String jsonCode;

  const _DemoWidget(this.jsonCode, {Key? key}) : super(key: key);

  String get packageJson {
    return '''
  {"id": "demoTest",
    "name": "45*70mm（标签）",
    "type": "label",
    "width": 360.0,
    "height": 560.0,
    "padding": [
      8.0,
      20.0,
      46.0,
      47.0
    ],
    "content": [
      $jsonCode
    ]}
  ''';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: JsonLayoutWidget(
            jsonString: packageJson,
            jsonData: TestConfig.data,
          ),
        );
      },
    );
  }
}
