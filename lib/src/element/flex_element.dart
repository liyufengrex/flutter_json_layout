import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:smart_dart_json/smart_dart_json.dart';
import '../factory/dynamic_element_parse_tool.dart';
import 'base/base_element.dart';

///权重容器
class ExpandedContainer extends TempBaseElement {
  final int flex;
  final TempBaseElement child;

  ExpandedContainer({
    this.flex = 1,
    required this.child,
  });

  @override
  DynamicElementType get type => DynamicElementType.expand;

  factory ExpandedContainer.fromMap(SDartJson json) {
    return ExpandedContainer(
      flex: json['flex'].getInt ?? 1,
      child: DynamicElementParseTool.buildTempElement(json['child']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['flex'] = flex;
    map['child'] = child.toJson();
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "flex": $flex, "child": ${child.toJsonString()}}';
  }
}