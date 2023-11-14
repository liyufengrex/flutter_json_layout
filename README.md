# flutter_json_layout

## 打印模版动态化方案

公司业务需要动态下发打印票据的模板，使用 flutter 进行绘制，最终实现票据模板的打印。

### 设计理念

将 flutter-widget 映射成 json 文件，使用 json 制作布局文件，下发到端上，由端上进行数据组装，完成最后一步渲染。

### 使用方式
```dart
DynamicJsonLayout(
      tempJson: '布局的转义json',
      data: '数据映射的转义json',
    )
```

[点击预览效果](https://liyufengrex.github.io/flutter_json_layout_preview/)

备用地址：https://flutter-json-layout.web.app/

该库持续完善中...



