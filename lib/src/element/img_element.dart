import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:pd_dart_json/pd_dart_json.dart';

import 'base/base_element.dart';

///图片容器
class ImgContainer extends TempBaseElement {
  final double width;
  final double height;
  final String url;

  ImgContainer({
    required this.width,
    required this.height,
    required this.url,
  });

  @override
  DynamicElementType get type => DynamicElementType.img;

  factory ImgContainer.fromMap(PDDartJson json) {
    return ImgContainer(
      width: json['width'].doubleValue,
      height: json['height'].doubleValue,
      url: json['url'].stringValue,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['width'] = width;
    map['height'] = height;
    map['url'] = url;
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "height": $height, "width": $width, "url": $url}';
  }
}
