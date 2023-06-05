import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:pd_dart_json/pd_dart_json.dart';
import '../factory/dynamic_element_parse_tool.dart';
import 'base/base_element.dart';

/// 尺寸容器
class SizeContainer extends TempBaseElement {
  final double? width;
  final double? height;
  final TempBaseElement? child;

  SizeContainer({
    this.width,
    this.height,
    this.child,
  });

  @override
  DynamicElementType get type => DynamicElementType.sizeBox;

  factory SizeContainer.fromMap(PDDartJson json) {
    return SizeContainer(
      width: json['width'].getDouble,
      height: json['height'].getDouble,
      child: DynamicElementParseTool.buildTempElement(json['child']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['width'] = width;
    map['height'] = height;
    map['child'] = child?.toJson();
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "width": $width, "height": $height, "child": ${child?.toJsonString()}}';
  }
}