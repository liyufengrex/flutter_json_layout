import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:pd_dart_json/pd_dart_json.dart';
import 'base/base_element.dart';
import 'text_element.dart';

///二维码容器
class BarcodeContainer extends TempBaseElement {
  final double width;
  final double height;
  final TextContainer text;

  BarcodeContainer({
    required this.width,
    required this.height,
    required this.text,
  });

  @override
  DynamicElementType get type => DynamicElementType.barcode;

  factory BarcodeContainer.fromMap(PDDartJson json) {
    return BarcodeContainer(
      width: json['width'].doubleValue,
      height: json['height'].doubleValue,
      text: TextContainer.fromMap(json['text']),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = super.toJson();
    map['width'] = width;
    map['height'] = height;
    map['text'] = text.toJson();
    return map;
  }

  @override
  String toJsonString() {
    return '{"type": "${type.key}", "height": $height, "width": $width, "text": ${text.toJsonString()}}';
  }
}
