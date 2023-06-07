import 'package:flutter/material.dart';

import '../base/base_element.dart';

extension ExDynamicElementType on DynamicElementType {
  String get key {
    switch (this) {
      case DynamicElementType.empty:
        return 'empty';
      case DynamicElementType.sizeBox:
        return 'sizeBox';
      case DynamicElementType.text:
        return 'text';
      case DynamicElementType.autoSizeTextSpan:
        return 'autoSizeTextSpan';
      case DynamicElementType.colum:
        return 'colum';
      case DynamicElementType.row:
        return 'row';
      case DynamicElementType.expand:
        return 'expand';
      case DynamicElementType.divider:
        return 'divider';
      case DynamicElementType.padding:
        return 'padding';
      case DynamicElementType.barcode:
        return 'barcode';
      case DynamicElementType.img:
        return 'img';
      case DynamicElementType.ifElse:
        return 'if-else';
    }
  }
}

extension ExMainAxisAlignment on MainAxisAlignment {
  String get key {
    switch (this) {
      case MainAxisAlignment.start:
        return 'start';
      case MainAxisAlignment.end:
        return 'end';
      case MainAxisAlignment.center:
        return 'center';
      case MainAxisAlignment.spaceBetween:
        return 'spaceBetween';
      case MainAxisAlignment.spaceAround:
        return 'spaceAround';
      case MainAxisAlignment.spaceEvenly:
        return 'spaceEvenly';
    }
  }
}

extension ExMainAxisSize on MainAxisSize {
  String get key {
    switch (this) {
      case MainAxisSize.min:
        return 'min';
      case MainAxisSize.max:
        return 'max';
    }
  }
}

extension ExCrossAxisAlignment on CrossAxisAlignment {
  String get key {
    switch (this) {
      case CrossAxisAlignment.start:
        return 'start';
      case CrossAxisAlignment.end:
        return 'end';
      case CrossAxisAlignment.center:
        return 'center';
      case CrossAxisAlignment.stretch:
        return 'stretch';
      case CrossAxisAlignment.baseline:
        return 'baseline';
    }
  }
}

extension ExVerticalDirection on VerticalDirection {
  String get key {
    switch (this) {
      case VerticalDirection.down:
        return 'down';
      case VerticalDirection.up:
        return 'up';
    }
  }
}

extension ExFontWeight on FontWeight {
  String get key {
    switch (this) {
      case FontWeight.w100:
        return '1';
      case FontWeight.w200:
        return '2';
      case FontWeight.w300:
        return '3';
      case FontWeight.w400:
        return '4';
      case FontWeight.w500:
        return '5';
      case FontWeight.w600:
        return '6';
      case FontWeight.w700:
        return '7';
      case FontWeight.w800:
        return '8';
      case FontWeight.w900:
        return '9';
      default:
        return '4';
    }
  }
}
