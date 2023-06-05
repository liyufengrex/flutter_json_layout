/// 根据数据模型 T，各模板自行继承实现
abstract class DynamicDataMappingInterface<T> {
  String matchKeyValue(
    T data, {
    required String textKey,
  });

  bool candidate(
    T data, {
    required String candidateValue,
  }) {
    return false;
  }
}
