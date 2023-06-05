import 'package:flutter/material.dart';
import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:pd_dart_json/pd_dart_json.dart';
import '../factory/dynamic_element_parse_tool.dart';
import 'base/base_element.dart';

/// 行容器
class RowContainer extends TempBaseElement {
  final MainAxisSize? mainAxisSize;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final VerticalDirection? verticalDirection;
  final List<TempBaseElement> children;

  RowContainer({
    this.mainAxisSize,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.verticalDirection,
    required this.children,
  });

  @override
  DynamicElementType get type => DynamicElementType.row;

  factory RowContainer.fromMap(PDDartJson json) {
    return RowContainer(
        mainAxisSize: DynamicElementParseTool.matchMainAxisSize(
            json['mainAxisSize'].stringValue),
        mainAxisAlignment: DynamicElementParseTool.matchMainAxisAlignment(
            json['mainAxisAlignment'].stringValue),
        crossAxisAlignment: DynamicElementParseTool.matchCrossAxisAlignment(
            json['crossAxisAlignment'].stringValue),
        verticalDirection: DynamicElementParseTool.matchVerticalDirection(
            json['verticalDirection'].stringValue),
        children: json['children']
            .arrayValue
            .map((e) => DynamicElementParseTool.buildTempElement(e))
            .toList());
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['mainAxisSize'] = mainAxisSize?.key;
    map['mainAxisAlignment'] = mainAxisAlignment?.key;
    map['crossAxisAlignment'] = crossAxisAlignment?.key;
    map['verticalDirection'] = verticalDirection?.key;
    map['children'] = children.map((e) => e.toJson()).toList();
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "mainAxisSize": "${mainAxisSize?.key}", "mainAxisAlignment": "${mainAxisAlignment?.key}", "crossAxisAlignment": "${crossAxisAlignment?.key}", "verticalDirection": "${verticalDirection?.key}", "children": ${children.map((e) => e.toJsonString()).toList()}}';
  }
}
