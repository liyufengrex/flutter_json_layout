abstract class TestConfig {
  static const tempJson = '''
  {
  "id": "label_chaYiJi_3",
  "name": "45*70mm（标签）",
  "type": "label",
  "width": 360.0,
  "height": 560.0,
  "padding": [
    8.0,
    20.0,
    46.0,
    47.0
  ],
  "content": [
    {
      "type": "row",
      "mainAxisSize": "min",
      "mainAxisAlignment": null,
      "crossAxisAlignment": "end",
      "verticalDirection": "up",
      "children": [
        {
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
    },
    {
      "type": "row",
      "mainAxisSize": null,
      "mainAxisAlignment": null,
      "crossAxisAlignment": "end",
      "verticalDirection": "up",
      "children": [
        {
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
    },
    {
      "type": "sizeBox",
      "width": null,
      "height": 12.5,
      "child": null
    },
    {
      "type": "divider",
      "height": 3.0,
      "thickness": 3.0
    },
    {
      "type": "sizeBox",
      "width": null,
      "height": 8.0,
      "child": null
    },
    {
      "type": "text",
      "key": "*{productName}",
      "fontSize": 32.0,
      "lineHeight": null,
      "fontWeight": "8"
    },
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
        "children": [
          {
            "type": "text",
            "key": "\\n\\n*{takeSerialNum} 杯",
            "fontSize": 18.0,
            "lineHeight": 1.0,
            "fontWeight": "7"
          }
        ]
      }
    },
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
        "key": "嘿嘿嘿~\\n①杯好茶①起喝",
        "fontSize": 17.0,
        "lineHeight": null,
        "fontWeight": "8"
      }
    },
    {
      "type": "sizeBox",
      "width": null,
      "height": 8.0,
      "child": null
    },
    {
      "type": "padding",
      "padding": [
        20.0,
        0.0,
        63.0,
        0.0
      ],
      "child": {
        "type": "divider",
        "height": 3.0,
        "thickness": 3.0
      }
    },
    {
      "type": "sizeBox",
      "width": null,
      "height": 10.0,
      "child": null
    },
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
          "children": [
            {
              "type": "expand",
              "flex": 1,
              "child": {
                "type": "colum",
                "mainAxisSize": "min",
                "mainAxisAlignment": null,
                "crossAxisAlignment": "start",
                "children": [
                  {
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
  ]
}
  ''';
  static const data = '''
  {
	"storeName": "李小轰的店铺",
	"takeCode": "5009",
	"takeType": "自取",
	"takeSerialNum": "2/5",
	"memberName": "李小轰",
	"productName": "霸气手摇草莓",
	"productDesc": "「少冰,微糖，茉莉初雪，大杯，加料脆猪猪果冻」",
	"barCode": "128456789012",
	"orderTime": "11:18 14:08",
	"isPackage": "true",
	"storeTel": "13756017111"
}
  ''';
}
