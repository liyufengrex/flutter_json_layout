import 'package:pd_dart_json/pd_dart_json.dart';
import 'candidate_mappding/candidate_config.dart';
import 'data_mapping/data_mapping_interface.dart';

class DynamicJsonDataMapping extends DynamicDataMappingInterface<PDDartJson> {
  @override
  String matchKeyValue(PDDartJson data, {required String textKey}) {
    var matchKey = textKey;
    var matchValue = '';
    var matchValuePre = '';
    var matchValueSu = '';
    const prefix = '*{';
    const suffix = '}';
    if (textKey.contains(prefix) && textKey.contains(suffix)) {
      final startIndex = textKey.indexOf(prefix) + prefix.length;
      final endIndex = textKey.indexOf(suffix);
      matchValuePre = textKey.substring(0, startIndex).replaceAll(
            prefix,
            '',
          );
      matchKey = textKey.substring(
        startIndex,
        endIndex,
      );
      matchValueSu = textKey.substring(endIndex).replaceAll(
            suffix,
            '',
          );
    }
    matchValue = data[matchKey].stringValue;
    if (matchValue.isEmpty) {
      return textKey;
    } else {
      return matchValuePre + matchValue + matchValueSu;
    }
  }

  String? parseCandidateValue(
    String candidate, {
    required String prefix,
    String suffix = CandidateConfig.candidateSuffix,
  }) {
    if (candidate.contains(prefix) && candidate.contains(suffix)) {
      final startIndex = candidate.indexOf(prefix) + prefix.length;
      final endIndex = candidate.indexOf(suffix);
      return candidate.substring(
        startIndex,
        endIndex,
      );
    }
    return null;
  }

  List<String>? parseCandidateElement(
    PDDartJson data, {
    required String candidateValue,
    required String prefix,
    String suffix = CandidateConfig.candidateSuffix,
  }) {
    final candidateStr = parseCandidateValue(
      candidateValue,
      prefix: prefix,
    );
    if (candidateStr != null) {
      final candidateStrArr = candidateStr.split(',');
      if (candidateStrArr.isNotEmpty) {
        return candidateStrArr
            .map((e) => matchKeyValue(data, textKey: e))
            .toList();
      } else {
        return <String>[matchKeyValue(data, textKey: candidateStr)];
      }
    }
    return null;
  }

  @override
  bool candidate(
    PDDartJson data, {
    required String candidateValue,
  }) {
    if (candidateValue.contains(CandidateConfig.candidateEmpty)) {
      final candidateElement = parseCandidateElement(
        data,
        candidateValue: candidateValue,
        prefix: CandidateConfig.candidateEmpty,
      );
      if (candidateElement != null) {
        final preElement = candidateElement.first;
        return preElement.isEmpty;
      }
    } else if (candidateValue.contains(CandidateConfig.candidateNotEmpty)) {
      final candidateElement = parseCandidateElement(
        data,
        candidateValue: candidateValue,
        prefix: CandidateConfig.candidateNotEmpty,
      );
      if (candidateElement != null) {
        final preElement = candidateElement.first;
        return preElement.isNotEmpty;
      }
    } else if (candidateValue.contains(CandidateConfig.candidateEqual)) {
      final candidateElement = parseCandidateElement(
        data,
        candidateValue: candidateValue,
        prefix: CandidateConfig.candidateEqual,
      );
      if (candidateElement != null && candidateElement.length == 2) {
        final preElement = candidateElement.first;
        final proElement = candidateElement.last;
        return preElement == proElement;
      }
    } else if (candidateValue.contains(CandidateConfig.candidateLt)) {
      final candidateElement = parseCandidateElement(
        data,
        candidateValue: candidateValue,
        prefix: CandidateConfig.candidateLt,
      );
      if (candidateElement != null && candidateElement.length == 2) {
        final preElement = double.tryParse(candidateElement.first) ?? 0;
        final proElement = double.tryParse(candidateElement.last) ?? 0;
        return preElement < proElement;
      }
    } else if (candidateValue.contains(CandidateConfig.candidateNlt)) {
      final candidateElement = parseCandidateElement(
        data,
        candidateValue: candidateValue,
        prefix: CandidateConfig.candidateNlt,
      );
      if (candidateElement != null && candidateElement.length == 2) {
        final preElement = double.tryParse(candidateElement.first) ?? 0;
        final proElement = double.tryParse(candidateElement.last) ?? 0;
        return preElement <= proElement;
      }
    } else if (candidateValue.contains(CandidateConfig.candidateGt)) {
      final candidateElement = parseCandidateElement(
        data,
        candidateValue: candidateValue,
        prefix: CandidateConfig.candidateGt,
      );
      if (candidateElement != null && candidateElement.length == 2) {
        final preElement = double.tryParse(candidateElement.first) ?? 0;
        final proElement = double.tryParse(candidateElement.last) ?? 0;
        return preElement > proElement;
      }
    } else if (candidateValue.contains(CandidateConfig.candidateNgt)) {
      final candidateElement = parseCandidateElement(
        data,
        candidateValue: candidateValue,
        prefix: CandidateConfig.candidateNgt,
      );
      if (candidateElement != null && candidateElement.length == 2) {
        final preElement = double.tryParse(candidateElement.first) ?? 0;
        final proElement = double.tryParse(candidateElement.last) ?? 0;
        return preElement >= proElement;
      }
    }
    return false;
  }
}
