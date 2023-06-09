import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common_widget.dart';

class ModuleDescWidget extends StatelessWidget {
  const ModuleDescWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeGroupWidget(
      flex: 3,
      title: '概念',
      desc: '动态下发票据布局模版，在客户端进行数据组装后，用于打印业务：\n\n1. 动态模板包含两个部分：布局文件和数据文件\n2. 对于后管，需要动态下发的就是布局文件\n3. 布局文件 JSON 结构如下：',
      items: [
        const JsonContainer('''
      {
	        "id": "1", 
	        "name": "45mm * 70mm",
	        "type": "label", 
          "width": 360.0, 
          "height": 560.0, 
	        "padding": [5, 35, 75, 50], 
	        "content": [] 
      }
        '''),
        SizedBox(height: 10.w),
        const JsonContainer('''
      {
	        模版id,
	        模板尺寸描述文件
	        模板类型 - 标签/小票
         模板打印需生成图片的宽度像素
         模板打印需生成图片的高度像素
	        模板内边距[左，上，右，下]
	        用于填充模板的具体元素
      }
        '''),
      ],
    );
  }
}
