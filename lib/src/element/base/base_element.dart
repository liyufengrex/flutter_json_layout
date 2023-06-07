import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert' as convert;

/// 模板基础元素
abstract class TempBaseElement {
  String? id;

  DynamicElementType get type;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{}..['type'] = type.key;
  }

  String toJsonString();

  String toFormatJson() {
    final jsonObject = convert.jsonDecode(toJsonString());
    final prettyJsonString =
        const convert.JsonEncoder.withIndent('  ').convert(jsonObject);
    return prettyJsonString;
  }

  TempBaseElement({String? id}) {
    if (id == null){
      this.id ??= const Uuid().v1();
    } else {
      this.id = id;
    }
  }
}

/// 动态化元素类型
enum DynamicElementType {
  empty,
  sizeBox,
  text,
  autoSizeTextSpan,
  colum,
  row,
  expand,
  divider,
  padding,
  barcode,
  img,
  ifElse, //逻辑操作元素
}
