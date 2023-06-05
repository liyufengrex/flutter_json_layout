import 'package:example/test/test_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'page/code_edt_page.dart';
import 'widget/module_api_list_widget.dart';
import 'widget/module_desc_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(960, 540),
      builder: (context, screenChild) {
        return MaterialApp(
          title: '动态化票据模版工具',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            backgroundColor: Colors.white,
          ),
          home: screenChild,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Flutter Json Layout - 动态模板',
              textAlign: TextAlign.left,
            ),
          ),
        ),
        body: const _Home(),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  void _jump(Widget target) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return target;
        },
      ),
    );
  }

  Widget _body(){
    return Padding(
      padding: EdgeInsets.only(
        left: 60.w,
        top: 30.w,
        right: 60.w,
        bottom: 5.w,
      ),
      child: Row(
        children: [
          const ModuleDescWidget(),
          SizedBox(width: 20.w),
          const ModuleApiListWidget(),
          SizedBox(width: 20.w),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                _jump(
                  const CodeEdtPage(
                    initialJsonTemp: TestConfig.tempJson,
                    initialData: TestConfig.data,
                  ),
                );
              },
              child: const Text('开始创建动态模板'),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }
}
