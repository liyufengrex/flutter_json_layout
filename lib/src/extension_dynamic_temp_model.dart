
import 'dynamic_temp_model.dart';
import 'element/base/base_element.dart';
import 'element/colum_element.dart';
import 'element/flex_element.dart';
import 'element/if_else_element.dart';
import 'element/padding_element.dart';
import 'element/rich_element.dart';
import 'element/row_element.dart';
import 'element/size_element.dart';
import 'element/text_element.dart';

extension ExDynamicTempModel on DynamicTempModel {
  //根据 id 替换元素(目前只支持文本元素)
  DynamicTempModel replaceElement(TempBaseElement target) {
    for (int index = 0; index < content.length; index++) {
      content[index].replaceElement(target);
    }
    return this;
  }
}

extension ExTempBaseElement on TempBaseElement {
  //根据 id 替换元素(目前只支持文本元素)
  void replaceElement(TempBaseElement target) {
    switch (type) {
      case DynamicElementType.empty:
        break;
      case DynamicElementType.sizeBox:
        (this as SizeContainer).child?.replaceElement(target);
        break;
      case DynamicElementType.text:
        if (id == target.id && target is TextContainer) {
          (this as TextContainer).fontSize = target.fontSize;
          (this as TextContainer).fontWeight = target.fontWeight;
          (this as TextContainer).lineHeight = target.lineHeight;
        }
        break;
      case DynamicElementType.autoSizeTextSpan:
        if (id == target.id && target is AutoSizeTextSpan) {
          (this as AutoSizeTextSpan).children = target.children;
          (this as AutoSizeTextSpan).text = target.text;
        }
        break;
      case DynamicElementType.colum:
        for (var element in (this as ColumContainer).children) {
          element.replaceElement(target);
        }
        break;
      case DynamicElementType.row:
        for (var element in (this as RowContainer).children) {
          element.replaceElement(target);
        }
        break;
      case DynamicElementType.expand:
        (this as ExpandedContainer).child.replaceElement(target);
        break;
      case DynamicElementType.divider:
        break;
      case DynamicElementType.padding:
        (this as PaddingContainer).child.replaceElement(target);
        break;
      case DynamicElementType.barcode:
        break;
      case DynamicElementType.ifElse:
        (this as IfElseCandidate).ifChild.replaceElement(target);
        (this as IfElseCandidate).elseChild?.replaceElement(target);
        break;
    }
  }
}
