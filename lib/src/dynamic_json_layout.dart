import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pd_dart_json/pd_dart_json.dart';
import 'data_mapping/data_mapping_interface.dart';
import 'dynamic_json_data_mapping.dart';
import 'dynamic_temp_model.dart';
import 'element/base/base_element.dart';
import 'factory/dynamic_temp_factory.dart';

/// 动态json布局
class DynamicJsonLayout extends StatelessWidget {
  final String tempJson;
  final String data;
  final Function(
    DynamicTempModel originTemp,
    TempBaseElement baseElement,
  )? onElementSelectTap;

  const DynamicJsonLayout({
    Key? key,
    required this.tempJson,
    required this.data,
    this.onElementSelectTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tempModel = DynamicTempModel.fromMap(
      PDDartJson(tempJson),
    );
    if (tempModel.height <= 0 ||
        tempModel.width <= 0 ||
        tempModel.padding.length != 4) {
      return const Text(
        '票据模版主体解析错误',
        style: TextStyle(
          fontSize: 28,
          color: Colors.red,
        ),
      );
    }
    return DynamicJsonBuilder(
      tempModel,
      onElementSelectTap: onElementSelectTap,
    ).build(
      PDDartJson(data),
    );
  }
}

class DynamicJsonBuilder extends DynamicTempFactory<PDDartJson> {
  final DynamicTempModel tempConfig;
  final Function(
    DynamicTempModel originTemp,
    TempBaseElement baseElement,
  )? onElementSelectTap;

  DynamicJsonBuilder(
    this.tempConfig, {
    this.onElementSelectTap,
  });

  @override
  DynamicDataMappingInterface<PDDartJson> get dataMapping =>
      DynamicJsonDataMapping();

  Widget build(PDDartJson data) {
    return SizedBox(
      width: tempConfig.width.w,
      height: tempConfig.height.w,
      child: buildTempWidget(
        config: tempConfig,
        data: data,
        onElementSelect: onElementSelectTap == null
            ? null
            : (element) {
                onElementSelectTap!(tempConfig, element);
              },
      ),
    );
  }
}

// 数据映射
