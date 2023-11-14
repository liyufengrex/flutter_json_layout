import 'package:flutter/services.dart';
import 'package:smart_dart_json/smart_dart_json.dart';
import 'element/base/base_element.dart';
import 'factory/dynamic_element_parse_tool.dart';
import 'dart:convert' as convert;

/// 动态模板
class DynamicTempModel {
  final String id; //模板id
  final String name; //模板名称
  final String type; //模板类型（label,receipt）
  final double width; //像素宽度
  final double height; //像素高度
  final List<double> padding; //left,top,right,bottom
  final List<TempBaseElement> content;

  DynamicTempModel({
    required this.id,
    required this.name,
    required this.type,
    required this.width,
    required this.height,
    required this.padding,
    required this.content,
  });

  factory DynamicTempModel.fromMap(SDartJson json) {
    return DynamicTempModel(
      id: json['id'].stringValue,
      name: json['name'].stringValue,
      type: json['type'].stringValue,
      width: json['width'].doubleValue,
      height: json['height'].doubleValue,
      padding: json['padding'].arrayValue.map((e) => e.doubleValue).toList(),
      content: json['content']
          .arrayValue
          .map((e) => DynamicElementParseTool.buildTempElement(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{}
      ..['id'] = id
      ..['name'] = name
      ..['type'] = type
      ..['width'] = width
      ..['height'] = height
      ..['padding'] = padding
      ..['content'] = content.map((e) => e.toJson()).toList();
  }

  String toJsonString() {
    return '{"id": "$id", "name": "$name", "type": "$type", "width": $width, "height": $height, "padding": $padding, "content": ${content.map((e) => e.toJsonString()).toList()}}';
  }

  String toFormatJson() {
    final jsonObject = convert.jsonDecode(toJsonString());
    final prettyJsonString = const convert.JsonEncoder.withIndent('  ').convert(jsonObject);
    return prettyJsonString;
  }

  static Future<DynamicTempModel> loadTempConfigByPath(String path) async {
    String jsonData = await rootBundle.loadString(
      path,
      cache: false,
    );
    return DynamicTempModel.fromMap(SDartJson(jsonData));
  }
}
