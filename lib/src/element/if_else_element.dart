import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:pd_dart_json/pd_dart_json.dart';
import '../factory/dynamic_element_parse_tool.dart';
import 'base/base_element.dart';

///逻辑操作元素 if - else
class IfElseCandidate extends TempBaseElement {
  final String candidate; //判断条件
  final TempBaseElement ifChild; // if 条件成功匹配的 widget
  final TempBaseElement? elseChild; // else 条件成功匹配的 widget

  IfElseCandidate({
    required this.candidate,
    required this.ifChild,
    this.elseChild,
  });

  @override
  DynamicElementType get type => DynamicElementType.ifElse;

  factory IfElseCandidate.fromMap(PDDartJson json) {
    return IfElseCandidate(
      candidate: json['candidate'].stringValue,
      ifChild: DynamicElementParseTool.buildTempElement(json['ifChild']),
      elseChild: DynamicElementParseTool.buildTempElement(json['elseChild']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['candidate'] = candidate;
    map['ifChild'] = ifChild.toJson();
    map['elseChild'] = elseChild?.toJson();
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "candidate": "$candidate", "ifChild": ${ifChild.toJsonString()}, "elseChild": ${elseChild?.toJsonString()}}';
  }
}
