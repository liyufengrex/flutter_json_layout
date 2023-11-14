import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:smart_dart_json/smart_dart_json.dart';
import 'base/base_element.dart';

///分割线
class DividerContainer extends TempBaseElement {
  final double? height;
  final double? thickness;

  DividerContainer({
    this.height,
    this.thickness,
  });

  @override
  DynamicElementType get type => DynamicElementType.divider;

  factory DividerContainer.fromMap(SDartJson json) {
    return DividerContainer(
      height: json['height'].getDouble,
      thickness: json['thickness'].getDouble,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['height'] = height ?? 0;
    map['thickness'] = thickness ?? 0;
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "height": ${height ?? 0}, "thickness": ${thickness ?? 0}}';
  }
}
