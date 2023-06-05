import 'package:example/tool/json_tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_json_layout/flutter_json_layout.dart';

class JsonLayoutWidget extends StatelessWidget {
  final String jsonString;
  final String jsonData;
  final Function(
    DynamicTempModel originTemp,
    TempBaseElement baseElement,
  )? onElementSelectTap;

  const JsonLayoutWidget({
    Key? key,
    required this.jsonString,
    required this.jsonData,
    this.onElementSelectTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jsonTemp = JsonTool.toJsonString(jsonString);
    var data = JsonTool.toJsonString(jsonData);
    return DynamicJsonLayout(
      tempJson: jsonTemp,
      data: data,
      onElementSelectTap: onElementSelectTap,
    );
  }
}
