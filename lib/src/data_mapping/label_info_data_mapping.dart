// import 'data_mapping_interface.dart';
//
// /// 标签动态化内容填充映射工具
// class LabelInfoDataMapping
//     extends DynamicDataMappingInterface<LabelProductModel> {
//   // 对应动态化模板中 textElement - key 字段填充值
//   static const String _mappingStoreName = 'storeName';
//   static const String _mappingStoreTel = 'storeTel';
//   static const String _mappingTakeCode = 'takeCode';
//   static const String _mappingBarCode = 'barCode';
//   static const String _mappingTakeType = 'takeType';
//   static const String _mappingTakeSerialNum = 'takeSerialNum';
//   static const String _mappingMemberName = 'memberName';
//   static const String _mappingProductName = 'productName';
//   static const String _mappingProductDesc = 'productDesc';
//   static const String _mappingOrderTime = 'orderTime';
//   static const String _mappingTableNum = 'tableNum';
//   static const String _mappingIsReType = 'isReType';
//
//   // 匹配 textElement key 对应的填充值
//   @override
//   String matchKeyValue(
//     LabelProductModel data, {
//     required String textKey,
//   }) {
//     var matchKey = textKey;
//     var matchValue = '';
//     var matchValuePre = '';
//     var matchValueSu = '';
//     const prefix = '*{';
//     const suffix = '}';
//     if (textKey.contains(prefix) && textKey.contains(suffix)) {
//       final startIndex = textKey.indexOf(prefix) + prefix.length;
//       final endIndex = textKey.indexOf(suffix);
//       matchValuePre = textKey.substring(0, startIndex).replaceAll(
//             prefix,
//             '',
//           );
//       matchKey = textKey.substring(
//         startIndex,
//         endIndex,
//       );
//       matchValueSu = textKey.substring(endIndex).replaceAll(
//             suffix,
//             '',
//           );
//     }
//     switch (matchKey) {
//       case _mappingStoreName:
//         matchValue = data.storeName;
//         break;
//       case _mappingStoreTel:
//         matchValue = SaasPrintConfig.storeTelNumber;
//         break;
//       case _mappingTakeCode:
//         matchValue = data.takeCode;
//         break;
//       case _mappingBarCode:
//         matchValue = data.barCode;
//         break;
//       case _mappingTakeType:
//         matchValue = data.takeType;
//         break;
//       case _mappingTakeSerialNum:
//         matchValue = data.takeSerialNum;
//         break;
//       case _mappingMemberName:
//         matchValue = data.memberName;
//         break;
//       case _mappingProductName:
//         matchValue = data.productName;
//         break;
//       case _mappingProductDesc:
//         matchValue = data.productDesc;
//         break;
//       case _mappingOrderTime:
//         matchValue = data.orderTime;
//         break;
//       case _mappingTableNum:
//         matchValue = data.tableNum;
//         break;
//       case _mappingIsReType:
//         matchValue = data.isReType ? '重' : '';
//         break;
//       default:
//         matchValue = textKey;
//     }
//     return matchValue.isEmpty ? "" : matchValuePre + matchValue + matchValueSu;
//   }
// }
