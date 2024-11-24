// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SummaryObjStruct extends FFFirebaseStruct {
  SummaryObjStruct({
    String? summary,
    int? steps,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _summary = summary,
        _steps = steps,
        super(firestoreUtilData);

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  set summary(String? val) => _summary = val;

  bool hasSummary() => _summary != null;

  // "steps" field.
  int? _steps;
  int get steps => _steps ?? 0;
  set steps(int? val) => _steps = val;

  void incrementSteps(int amount) => steps = steps + amount;

  bool hasSteps() => _steps != null;

  static SummaryObjStruct fromMap(Map<String, dynamic> data) =>
      SummaryObjStruct(
        summary: data['summary'] as String?,
        steps: castToType<int>(data['steps']),
      );

  static SummaryObjStruct? maybeFromMap(dynamic data) => data is Map
      ? SummaryObjStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'summary': _summary,
        'steps': _steps,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'summary': serializeParam(
          _summary,
          ParamType.String,
        ),
        'steps': serializeParam(
          _steps,
          ParamType.int,
        ),
      }.withoutNulls;

  static SummaryObjStruct fromSerializableMap(Map<String, dynamic> data) =>
      SummaryObjStruct(
        summary: deserializeParam(
          data['summary'],
          ParamType.String,
          false,
        ),
        steps: deserializeParam(
          data['steps'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SummaryObjStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SummaryObjStruct &&
        summary == other.summary &&
        steps == other.steps;
  }

  @override
  int get hashCode => const ListEquality().hash([summary, steps]);
}

SummaryObjStruct createSummaryObjStruct({
  String? summary,
  int? steps,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SummaryObjStruct(
      summary: summary,
      steps: steps,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SummaryObjStruct? updateSummaryObjStruct(
  SummaryObjStruct? summaryObj, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    summaryObj
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSummaryObjStructData(
  Map<String, dynamic> firestoreData,
  SummaryObjStruct? summaryObj,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (summaryObj == null) {
    return;
  }
  if (summaryObj.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && summaryObj.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final summaryObjData = getSummaryObjFirestoreData(summaryObj, forFieldValue);
  final nestedData = summaryObjData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = summaryObj.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSummaryObjFirestoreData(
  SummaryObjStruct? summaryObj, [
  bool forFieldValue = false,
]) {
  if (summaryObj == null) {
    return {};
  }
  final firestoreData = mapToFirestore(summaryObj.toMap());

  // Add any Firestore field values
  summaryObj.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSummaryObjListFirestoreData(
  List<SummaryObjStruct>? summaryObjs,
) =>
    summaryObjs?.map((e) => getSummaryObjFirestoreData(e, true)).toList() ?? [];
