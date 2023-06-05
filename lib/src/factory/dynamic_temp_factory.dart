import 'package:auto_size_text/auto_size_text.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data_mapping/data_mapping_interface.dart';
import '../dynamic_temp_model.dart';
import '../element/barcode_element.dart';
import '../element/base/base_element.dart';
import '../element/colum_element.dart';
import '../element/divider_element.dart';
import '../element/flex_element.dart';
import '../element/if_else_element.dart';
import '../element/padding_element.dart';
import '../element/rich_element.dart';
import '../element/row_element.dart';
import '../element/size_element.dart';
import '../element/text_element.dart';

typedef OnElementSelect = void Function(TempBaseElement baseElement);

/// 动态化模板工厂
abstract class DynamicTempFactory<T> {
  DynamicDataMappingInterface<T> get dataMapping;

  Widget buildTempWidget({
    required DynamicTempModel config,
    required T data,
    OnElementSelect? onElementSelect,
  }) {
    return _DynamicLayoutWidget(
      dataMapping: dataMapping,
      config: config,
      data: data,
      onElementSelect: onElementSelect,
    );
  }
}

class _DynamicLayoutWidget<T> extends StatelessWidget {
  final DynamicDataMappingInterface dataMapping;
  final DynamicTempModel config;
  final T data;
  final OnElementSelect? onElementSelect;

  const _DynamicLayoutWidget({
    Key? key,
    required this.dataMapping,
    required this.config,
    required this.data,
    this.onElementSelect,
  }) : super(key: key);

  Widget _buildTempElement(
    TempBaseElement element,
    T data,
  ) {
    switch (element.type) {
      case DynamicElementType.empty:
        return Container();
      case DynamicElementType.sizeBox:
        return _buildSizeElement(
          element as SizeContainer,
          data,
        );
      case DynamicElementType.text:
        return _buildTextElement(
          element as TextContainer,
          data,
        );
      case DynamicElementType.autoSizeTextSpan:
        return _buildRichElement(
          element as AutoSizeTextSpan,
          data,
        );
      case DynamicElementType.colum:
        return _buildColumnElement(
          element as ColumContainer,
          data,
        );
      case DynamicElementType.row:
        return _buildRowElement(
          element as RowContainer,
          data,
        );
      case DynamicElementType.expand:
        return _buildFlexElement(
          element as ExpandedContainer,
          data,
        );
      case DynamicElementType.divider:
        return _buildDividerElement(
          element as DividerContainer,
          data,
        );
      case DynamicElementType.padding:
        return _buildPaddingElement(
          element as PaddingContainer,
          data,
        );
      case DynamicElementType.barcode:
        return _buildBarcodeElement(
          element as BarcodeContainer,
          data,
        );
      case DynamicElementType.ifElse:
        final ifElseCandidate = element as IfElseCandidate;
        if (dataMapping.candidate(
          data,
          candidateValue: ifElseCandidate.candidate,
        )) {
          return _buildTempElement(ifElseCandidate.ifChild, data);
        } else {
          if (ifElseCandidate.elseChild == null) {
            return Container();
          } else {
            return _buildTempElement(ifElseCandidate.elseChild!, data);
          }
        }
    }
  }

  Widget _buildSizeElement(SizeContainer sizeElementConfig, T data) {
    Widget? child;
    if (sizeElementConfig.child != null) {
      child = _buildTempElement(
        sizeElementConfig.child!,
        data,
      );
    }
    return SizedBox(
      height:
          sizeElementConfig.height == null ? null : sizeElementConfig.height!.w,
      width:
          sizeElementConfig.width == null ? null : sizeElementConfig.width!.w,
      child: child,
    );
  }

  Widget _buildTextElement(
    TextContainer textConfig,
    T data,
  ) {
    final text = dataMapping.matchKeyValue(
      data,
      textKey: textConfig.key,
    );
    if (text.isEmpty) {
      return Container();
    }
    final child = Text(
      text,
      style: TextStyle(
        fontSize: textConfig.fontSize.w,
        fontWeight: textConfig.fontWeight,
        height: textConfig.lineHeight,
      ),
    );
    if (onElementSelect == null) {
      return child;
    } else {
      return GestureDetector(
        onTap: () {
          onElementSelect!(textConfig);
        },
        child: child,
      );
    }
  }

  Widget _buildRichElement(AutoSizeTextSpan autoTextConfig, T data) {
    final text = autoTextConfig.text;
    final children = autoTextConfig.children
        .map(
          (e) => TextSpan(
            text: dataMapping.matchKeyValue(data, textKey: e.key),
            style: TextStyle(
              fontSize: e.fontSize.w,
              fontWeight: e.fontWeight,
              height: e.lineHeight,
            ),
          ),
        )
        .toList();
    final child =  LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          constraints: BoxConstraints(maxHeight: constraints.maxHeight),
          child: AutoSizeText.rich(
            TextSpan(
              text: dataMapping.matchKeyValue(data, textKey: text.key),
              style: TextStyle(
                fontWeight: text.fontWeight,
                fontSize: text.fontSize.w,
                height: text.lineHeight,
              ),
              children: children,
            ),
          ),
        );
      },
    );

    if (onElementSelect == null) {
      return child;
    } else {
      return GestureDetector(
        onTap: () {
          onElementSelect!(autoTextConfig);
        },
        child: child,
      );
    }
  }

  Widget _buildColumnElement(ColumContainer columConfig, T data) {
    return Column(
      mainAxisSize: columConfig.mainAxisSize,
      mainAxisAlignment:
          columConfig.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: columConfig.crossAxisAlignment,
      children: columConfig.children
          .map(
            (e) => _buildTempElement(e, data),
          )
          .toList(),
    );
  }

  Widget _buildRowElement(RowContainer rowConfig, T data) {
    return Row(
      mainAxisSize: rowConfig.mainAxisSize ?? MainAxisSize.max,
      mainAxisAlignment: rowConfig.mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment:
          rowConfig.crossAxisAlignment ?? CrossAxisAlignment.center,
      children: rowConfig.children
          .map(
            (e) => _buildTempElement(e, data),
          )
          .toList(),
    );
  }

  Widget _buildFlexElement(ExpandedContainer expandConfig, T data) {
    return Expanded(
      flex: expandConfig.flex,
      child: _buildTempElement(
        expandConfig.child,
        data,
      ),
    );
  }

  Widget _buildDividerElement(DividerContainer dividerConfig, T data) {
    return Divider(
      color: Colors.black,
      height: dividerConfig.height,
      thickness: dividerConfig.thickness,
    );
  }

  Widget _buildPaddingElement(PaddingContainer paddingConfig, T data) {
    return Padding(
      padding: EdgeInsets.only(
        left: paddingConfig.padding[0],
        top: paddingConfig.padding[1],
        right: paddingConfig.padding[2],
        bottom: paddingConfig.padding[3],
      ),
      child: _buildTempElement(
        paddingConfig.child,
        data,
      ),
    );
  }

  Widget _buildBarcodeElement(BarcodeContainer barcodeConfig, T data) {
    final text = dataMapping.matchKeyValue(
      data,
      textKey: barcodeConfig.text.key,
    );
    return BarcodeWidget(
      barcode: Barcode.qrCode(
        errorCorrectLevel: BarcodeQRCorrectionLevel.low,
      ),
      data: text,
      width: barcodeConfig.width.w,
      height: barcodeConfig.height.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: config.padding[0].w,
        top: config.padding[1].w,
        right: config.padding[2].w,
        bottom: config.padding[3].w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            config.content.map((e) => _buildTempElement(e, data)).toList(),
      ),
    );
  }
}
