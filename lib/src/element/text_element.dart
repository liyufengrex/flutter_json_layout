import 'package:flutter/material.dart';
import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:pd_dart_json/pd_dart_json.dart';
import '../factory/dynamic_element_parse_tool.dart';
import 'base/base_element.dart';

/// 文字容器
class TextContainer extends TempBaseElement {
  final String key; //匹配映射数据对应元素，匹配不上直接填充
  double fontSize;
  double? lineHeight;
  FontWeight fontWeight;

  TextContainer({
    String? id,
    required this.key,
    required this.fontSize,
    required this.lineHeight,
    required this.fontWeight,
  }) : super(id: id);

  @override
  DynamicElementType get type => DynamicElementType.text;

  factory TextContainer.fromMap(PDDartJson json) {
    return TextContainer(
      id: json['id'].string,
      key: json['key'].stringValue,
      fontSize: json['fontSize'].doubleValue,
      lineHeight: json['lineHeight'].getDouble,
      fontWeight: DynamicElementParseTool.matchFontWeight(
          json['fontWeight'].stringValue),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['key'] = key;
    map['fontSize'] = fontSize;
    map['lineHeight'] = lineHeight;
    map['fontWeight'] = fontWeight.key;
    return map;
  }

  String keyToJsonString() {
    return key.replaceAll('\n', '\\n');
  }

  @override
  String toJsonString() {
    return '{"id": "$id", "type": "${type.key}", "key": "${keyToJsonString()}", "fontSize": $fontSize, "lineHeight": $lineHeight, "fontWeight": ${fontWeight.key}}';
  }

  TextContainer copyWith({
    double? fontSize,
    double? lineHeight,
    FontWeight? fontWeight,
  }) {
    return TextContainer(
      key: key,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      lineHeight: lineHeight ?? this.lineHeight,
    );
  }
}
