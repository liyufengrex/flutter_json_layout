import 'package:flutter/material.dart';
import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:smart_dart_json/smart_dart_json.dart';
import '../factory/dynamic_element_parse_tool.dart';
import 'base/base_element.dart';

/// 列容器
class ColumContainer extends TempBaseElement {
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<TempBaseElement> children;

  ColumContainer({
    required this.mainAxisSize,
    this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.children,
  });

  @override
  DynamicElementType get type => DynamicElementType.colum;

  factory ColumContainer.fromMap(SDartJson json) {
    return ColumContainer(
        mainAxisSize: DynamicElementParseTool.matchMainAxisSize(
            json['mainAxisSize'].stringValue),
        mainAxisAlignment: DynamicElementParseTool.matchMainAxisAlignment(
            json['mainAxisAlignment'].stringValue),
        crossAxisAlignment: DynamicElementParseTool.matchCrossAxisAlignment(
            json['crossAxisAlignment'].stringValue),
        children: json['children']
            .arrayValue
            .map((e) => DynamicElementParseTool.buildTempElement(e))
            .toList());
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['mainAxisSize'] = mainAxisSize.key;
    map['mainAxisAlignment'] = mainAxisAlignment?.key;
    map['crossAxisAlignment'] = crossAxisAlignment.key;
    map['children'] = children.map((e) => e.toJson()).toList();
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "mainAxisSize": "${mainAxisSize.key}", "mainAxisAlignment": "${mainAxisAlignment?.key}", "crossAxisAlignment": "${crossAxisAlignment.key}", "children": ${children.map((e) => e.toJsonString()).toList()}}';
  }
}
