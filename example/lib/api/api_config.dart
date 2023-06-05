enum ApiEnum {
  text,
  colum,
  row,
  sizeBox,
  divider,
  flex,
  empty,
  padding,
  richText,
  barcode,
  ifElse,
}

extension ExApiEnum on ApiEnum {
  String get title {
    switch (this) {
      case ApiEnum.text:
        return 'text';
      case ApiEnum.colum:
        return 'colum';
      case ApiEnum.row:
        return 'row';
      case ApiEnum.sizeBox:
        return 'sizeBox';
      case ApiEnum.divider:
        return 'divider';
      case ApiEnum.flex:
        return 'flex';
      case ApiEnum.empty:
        return 'empty';
      case ApiEnum.padding:
        return 'padding';
      case ApiEnum.richText:
        return 'richText';
      case ApiEnum.barcode:
        return 'barcode';
      case ApiEnum.ifElse:
        return 'if-else';
    }
  }

  String get titleDesc {
    switch (this) {
      case ApiEnum.text:
        return 'text（文本块控件）';
      case ApiEnum.colum:
        return 'colum（列控件）';
      case ApiEnum.row:
        return 'row （行控件）';
      case ApiEnum.sizeBox:
        return 'sizeBox （大小限制控件）';
      case ApiEnum.divider:
        return 'divider（分割线）';
      case ApiEnum.flex:
        return 'flex（权重控件）';
      case ApiEnum.empty:
        return 'empty（空白块）';
      case ApiEnum.padding:
        return 'padding（内边距控件）';
      case ApiEnum.richText:
        return 'richText（字号自适应的富文本控件）';
      case ApiEnum.barcode:
        return 'barcode（二维码控件）';
      case ApiEnum.ifElse:
        return 'if-else（条件控件）';
    }
  }

  String get supportArr {
    switch (this) {
      case ApiEnum.text:
        return '''
	      . key: 文本框的内容，使用 *{} 进行数据映射
	      . fontSize: 字体大小
	      . lineHeight: 行间距
	      . fontWeight: 字重（字体粗度），范围 1 ~ 9
        ''';
      case ApiEnum.colum:
        return '''
	      . mainAxisSize: 大小限制
	          > min
	          > max
	      . mainAxisAlignment: 垂直排列规则
            > start
	          > end
	          > center
	          > spaceBetween
	          > spaceAround
	          > spaceEvenly
	      . crossAxisAlignment: 水平排列规则
	          > start
	          > end
	          > center
	          > stretch
	          > baseline
	      . children: [] 数组，可存放任意支持的元素控件
        ''';
      case ApiEnum.row:
        return '''
	      . mainAxisSize: 大小限制
	          > min
	          > max
	      . mainAxisAlignment: 垂直排列规则
            > start
	          > end
	          > center
	          > spaceBetween
	          > spaceAround
	          > spaceEvenly
	      . crossAxisAlignment: 水平排列规则
	          > start
	          > end
	          > center
	          > stretch
	          > baseline
	      . verticalDirection: 内容方向
	          > down
	          > up
	      . children: [] 数组，可存放任意支持的元素控件
        ''';
      case ApiEnum.sizeBox:
        return '''
	      . width: 容器宽度
	      . height: 容器高度
	      . child: 任意支持的元素控件
        ''';
      case ApiEnum.divider:
        return '''
	      . height: 分割线高度
	      . thickness: 分割线高度
        ''';
      case ApiEnum.flex:
        return '''
        需要与 coluem 或 row 配合使用
	      . flex: 权重比值
	      . child: 任意支持的元素控件
        ''';
      case ApiEnum.empty:
        return '';
      case ApiEnum.padding:
        return '''
	      . padding: [] 数组需填入4个值，依次标识左、上、右、下内边距
	      . child: 任意支持的元素控件
        ''';
      case ApiEnum.richText:
        return '''
        父节点需要限制大小
	      . text: 文本控件，其字体大小自适应
	      . children: [] 数组内为文本控件
        ''';
      case ApiEnum.barcode:
        return '''
	      . width: 二维码的像素宽度
	      . height: 二维码的像素高度
	      . text: 文本控件，内容为二维码的内容体
        ''';
      case ApiEnum.ifElse:
        return '''
	      . candidate: 需校验的判断条件
	          > isEmpty(a)` => a.isEmpty()
	          > isNotEmpty(a)` => a.isNotEmpty()
	          > equal(a, b)` => a == b
	          > lt(a, b)` => a < b
	          > nlt(a, b)` => a <= b
	          > gt(a, b)` => a > b
	          > ngt(a, b)` => a >= b
	      . ifChild: 判断成功显示的任意元素控件
	      . elseChild: 判断失败显示的任意元素控件
        ''';
    }
  }

  String get example {
    switch (this) {
      case ApiEnum.text:
        return '''
      {
	      "type": "text",
	      "key": "[*{takeType}]",
	      "fontSize": 30.0,
	      "lineHeight": 1.0,
	      "fontWeight": "8"
      }
        ''';
      case ApiEnum.colum:
        return '''
      {
        "type": "sizeBox",
        "width": null,
        "height": 95.0,
        "child": {
          "type": "padding",
          "padding": [
            20.0,
            0.0,
            0.0,
            0.0
          ],
          "child": {
            "type": "row",
            "mainAxisSize": null,
            "mainAxisAlignment": null,
            "crossAxisAlignment": "end",
            "verticalDirection": null,
            "children": [{
                "type": "expand",
                "flex": 1,
                "child": {
                  "type": "colum",
                  "mainAxisSize": "min",
                  "mainAxisAlignment": null,
                  "crossAxisAlignment": "start",
                  "children": [{
                      "type": "text",
                      "key": "*{orderTime}",
                      "fontSize": 15.0,
                      "lineHeight": 1.0,
                      "fontWeight": "8"
                    },
                    {
                      "type": "sizeBox",
                      "width": null,
                      "height": 13.0,
                      "child": null
                    },
                    {
                      "type": "text",
                      "key": "*{storeName}",
                      "fontSize": 15.0,
                      "lineHeight": 1.0,
                      "fontWeight": "8"
                    },
                    {
                      "type": "sizeBox",
                      "width": null,
                      "height": 13.0,
                      "child": null
                    },
                    {
                      "type": "text",
                      "key": "电话：*{storeTel}",
                      "fontSize": 15.0,
                      "lineHeight": 1.0,
                      "fontWeight": "8"
                    }
                  ]
                }
              },
              {
                "type": "sizeBox",
                "width": 10.0,
                "height": null,
                "child": null
              },
              {
                "type": "barcode",
                "width": 65.0,
                "height": 65.0,
                "text": {
                  "type": "text",
                  "key": "*{barCode}",
                  "fontSize": 10.0,
                  "lineHeight": null,
                  "fontWeight": "4"
                }
              }
            ]
          }
        }
      }
        ''';
      case ApiEnum.row:
        return '''
      {
        "type": "row",
        "mainAxisSize": "min",
        "mainAxisAlignment": null,
        "crossAxisAlignment": "end",
        "verticalDirection": "up",
        "children": [{
            "type": "text",
            "key": "*{takeCode}",
            "fontSize": 62.0,
            "lineHeight": 1.0,
            "fontWeight": "8"
          },
          {
            "type": "if-else",
            "candidate": "equal(*{isPackage},true)",
            "ifChild": {
              "type": "text",
              "key": "重",
              "fontSize": 19.0,
              "lineHeight": 1.0,
              "fontWeight": "4"
            }
          }
        ]
      }
        ''';
      case ApiEnum.sizeBox:
        return '''
      {
        "type": "sizeBox",
        "width": null,
        "height": 12.5,
        "child": null
      }
        ''';
      case ApiEnum.divider:
        return '''
      {
        "type": "divider",
        "height": 3.0,
        "thickness": 3.0
      }
        ''';
      case ApiEnum.flex:
        return '''
      {
        "type": "row",
        "mainAxisSize": null,
        "mainAxisAlignment": null,
        "crossAxisAlignment": "end",
        "verticalDirection": "up",
        "children": [{
            "type": "text",
            "key": "[*{takeType}]",
            "fontSize": 30.0,
            "lineHeight": 1.0,
            "fontWeight": "8"
          },
          {
            "type": "expand",
            "flex": 1,
            "child": {
              "type": "empty"
            }
          },
          {
            "type": "text",
            "key": "30分钟内饮用口感更佳",
            "fontSize": 14.0,
            "lineHeight": 1.0,
            "fontWeight": "7"
          }
        ]
      }
        ''';
      case ApiEnum.empty:
        return '''
      {
        "type": "row",
        "mainAxisSize": null,
        "mainAxisAlignment": null,
        "crossAxisAlignment": "end",
        "verticalDirection": "up",
        "children": [{
            "type": "text",
            "key": "[*{takeType}]",
            "fontSize": 30.0,
            "lineHeight": 1.0,
            "fontWeight": "8"
          },
          {
            "type": "expand",
            "flex": 1,
            "child": {
              "type": "empty"
            }
          },
          {
            "type": "text",
            "key": "30分钟内饮用口感更佳",
            "fontSize": 14.0,
            "lineHeight": 1.0,
            "fontWeight": "7"
          }
        ]
      }
        ''';
      case ApiEnum.padding:
        return '''
      {
        "type": "padding",
        "padding": [
          20.0,
          0.0,
          0.0,
          0.0
        ],
        "child": {
          "type": "text",
          "key": "嘿嘿嘿~\n①杯好茶①起喝",
          "fontSize": 17.0,
          "lineHeight": null,
          "fontWeight": "8"
        }
      }
        ''';
      case ApiEnum.richText:
        return '''
      {
        "type": "expand",
        "flex": 1,
        "child": {
          "type": "autoSizeTextSpan",
          "text": {
            "type": "text",
            "key": "*{productDesc}",
            "fontSize": 20.0,
            "lineHeight": null,
            "fontWeight": "8"
          },
          "children": [{
            "type": "text",
            "key": "\n\n*{takeSerialNum} 杯",
            "fontSize": 18.0,
            "lineHeight": 1.0,
            "fontWeight": "7"
          }]
        }
      }
        ''';
      case ApiEnum.barcode:
        return '''
      {
        "type": "barcode",
        "width": 65.0,
        "height": 65.0,
        "text": {
          "type": "text",
          "key": "*{barCode}",
          "fontSize": 10.0,
          "lineHeight": null,
          "fontWeight": "4"
        }
      }
        ''';
      case ApiEnum.ifElse:
        return '''
      {
        "type": "row",
        "mainAxisSize": "min",
        "mainAxisAlignment": null,
        "crossAxisAlignment": "end",
        "verticalDirection": "up",
        "children": [{
            "type": "text",
            "key": "*{takeCode}",
            "fontSize": 62.0,
            "lineHeight": 1.0,
            "fontWeight": "8"
          },
          {
            "type": "if-else",
            "candidate": "equal(*{isPackage},true)",
            "ifChild": {
              "type": "text",
              "key": "重",
              "fontSize": 19.0,
              "lineHeight": 1.0,
              "fontWeight": "4"
            }
          }
        ]
      }
        ''';
    }
  }
}
