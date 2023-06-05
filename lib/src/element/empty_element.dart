
import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'base/base_element.dart';

/// 空白容器
class EmptyContainer extends TempBaseElement {
  @override
  DynamicElementType get type => DynamicElementType.empty;

  @override
  String toJsonString() {
    return '{"type": "${type.key}"}';
  }
}