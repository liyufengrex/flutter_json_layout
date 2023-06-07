import 'package:flutter/material.dart';
import 'package:flutter_json_layout/src/element/extension/element_extension.dart';
import 'package:pd_dart_json/pd_dart_json.dart';
import '../element/barcode_element.dart';
import '../element/base/base_element.dart';
import '../element/colum_element.dart';
import '../element/divider_element.dart';
import '../element/empty_element.dart';
import '../element/flex_element.dart';
import '../element/if_else_element.dart';
import '../element/img_element.dart';
import '../element/padding_element.dart';
import '../element/rich_element.dart';
import '../element/row_element.dart';
import '../element/size_element.dart';
import '../element/text_element.dart';

abstract class DynamicElementParseTool {
  static MainAxisAlignment matchMainAxisAlignment(String key) {
    if (key == MainAxisAlignment.end.key) {
      return MainAxisAlignment.end;
    } else if (key == MainAxisAlignment.center.key) {
      return MainAxisAlignment.center;
    } else if (key == MainAxisAlignment.spaceBetween.key) {
      return MainAxisAlignment.spaceBetween;
    } else if (key == MainAxisAlignment.spaceAround.key) {
      return MainAxisAlignment.spaceAround;
    } else if (key == MainAxisAlignment.spaceEvenly.key) {
      return MainAxisAlignment.spaceEvenly;
    } else {
      return MainAxisAlignment.start;
    }
  }

  static MainAxisSize matchMainAxisSize(String key) {
    if (key == MainAxisSize.min.key) {
      return MainAxisSize.min;
    } else {
      return MainAxisSize.max;
    }
  }

  static FontWeight matchFontWeight(String key) {
    switch (key) {
      case '1':
        return FontWeight.w100;
      case '2':
        return FontWeight.w200;
      case '3':
        return FontWeight.w300;
      case '4':
        return FontWeight.w400;
      case '5':
        return FontWeight.w500;
      case '6':
        return FontWeight.w600;
      case '7':
        return FontWeight.w700;
      case '8':
        return FontWeight.w800;
      case '9':
        return FontWeight.w900;
      default:
        return FontWeight.w400;
    }
  }

  static CrossAxisAlignment matchCrossAxisAlignment(String key) {
    if (key == CrossAxisAlignment.start.key) {
      return CrossAxisAlignment.start;
    } else if (key == CrossAxisAlignment.end.key) {
      return CrossAxisAlignment.end;
    } else if (key == CrossAxisAlignment.stretch.key) {
      return CrossAxisAlignment.stretch;
    } else if (key == CrossAxisAlignment.baseline.key) {
      return CrossAxisAlignment.baseline;
    } else {
      return CrossAxisAlignment.center;
    }
  }

  static VerticalDirection matchVerticalDirection(String key) {
    if (key == VerticalDirection.up.key) {
      return VerticalDirection.up;
    } else {
      return VerticalDirection.down;
    }
  }

  /// 解析模板元素
  static TempBaseElement buildTempElement(PDDartJson json) {
    final type = json['type'].stringValue;
    if (type == DynamicElementType.text.key) {
      //文本
      return TextContainer.fromMap(json);
    } else if (type == DynamicElementType.autoSizeTextSpan.key) {
      //自适应高度的富文本
      return AutoSizeTextSpan.fromMap(json);
    } else if (type == DynamicElementType.sizeBox.key) {
      //尺寸容器
      return SizeContainer.fromMap(json);
    } else if (type == DynamicElementType.row.key) {
      //行容器
      return RowContainer.fromMap(json);
    } else if (type == DynamicElementType.colum.key) {
      //列容器
      return ColumContainer.fromMap(json);
    } else if (type == DynamicElementType.expand.key) {
      //权重容器
      return ExpandedContainer.fromMap(json);
    } else if (type == DynamicElementType.divider.key) {
      //分割线
      return DividerContainer.fromMap(json);
    } else if (type == DynamicElementType.padding.key) {
      //padding
      return PaddingContainer.fromMap(json);
    } else if (type == DynamicElementType.barcode.key) {
      //二维码
      return BarcodeContainer.fromMap(json);
    } else if (type == DynamicElementType.img.key) {
      //图片
      return ImgContainer.fromMap(json);
    } else if (type == DynamicElementType.ifElse.key) {
      //if - else 条件判断
      return IfElseCandidate.fromMap(json);
    }else {
      return EmptyContainer();
    }
  }
}
