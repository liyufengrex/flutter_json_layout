import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:smart_dart_json/smart_dart_json.dart';
import '../factory/dynamic_element_parse_tool.dart';
import 'base/base_element.dart';

class PaddingContainer extends TempBaseElement {
  final List<double> padding; //left,top,right,bottom
  final TempBaseElement child;

  PaddingContainer({
    required this.padding,
    required this.child,
  });

  @override
  DynamicElementType get type => DynamicElementType.padding;

  factory PaddingContainer.fromMap(SDartJson json) {
    return PaddingContainer(
      padding: json['padding'].arrayValue.map((e) => e.doubleValue).toList(),
      child: DynamicElementParseTool.buildTempElement(json['child']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['padding'] = padding;
    map['child'] = child.toJson();
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "padding": $padding, "child": ${child.toJsonString()}}';
  }
}
