import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:smart_dart_json/smart_dart_json.dart';
import 'base/base_element.dart';
import 'text_element.dart';

/// 自适应大小的文本容器 （父节点需要限制大小）
class AutoSizeTextSpan extends TempBaseElement {
  TextContainer text;
  List<TextContainer> children;

  AutoSizeTextSpan({
    String? id,
    required this.text,
    required this.children,
  }):super(id: id);

  factory AutoSizeTextSpan.fromMap(SDartJson json) {
    return AutoSizeTextSpan(
      id: json['id'].string,
      text: TextContainer.fromMap(json['text']),
      children: json['children']
          .arrayValue
          .map((e) => TextContainer.fromMap(e))
          .toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['text'] = text.toJson();
    map['children'] = children.map((e) => e.toJson()).toList();
    return map;
  }

  @override
  String toJsonString() {
    return '{"id": "$id", "type": "${type.key}", "text": ${text.toJsonString()}, "children": ${children.map((e) => e.toJsonString()).toList()}}';
  }

  @override
  DynamicElementType get type => DynamicElementType.autoSizeTextSpan;
}
