abstract class JsonTool {
  static String toJsonString(String data) {
    var result = data.replaceAll('\n', '');
    result = result.replaceAll("'", '\"');
    result = result.replaceAll('"', '\"');
    result = result.trim();
    return result;
  }
}
