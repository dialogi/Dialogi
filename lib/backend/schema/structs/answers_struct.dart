// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswersStruct extends FFFirebaseStruct {
  AnswersStruct({
    AnswerType? type,
    List<String>? possibleAnswers,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _possibleAnswers = possibleAnswers,
        super(firestoreUtilData);

  // "type" field.
  AnswerType? _type;
  AnswerType get type => _type ?? AnswerType.single_select;
  set type(AnswerType? val) => _type = val;

  bool hasType() => _type != null;

  // "possible_answers" field.
  List<String>? _possibleAnswers;
  List<String> get possibleAnswers => _possibleAnswers ?? const [];
  set possibleAnswers(List<String>? val) => _possibleAnswers = val;

  void updatePossibleAnswers(Function(List<String>) updateFn) {
    updateFn(_possibleAnswers ??= []);
  }

  bool hasPossibleAnswers() => _possibleAnswers != null;

  static AnswersStruct fromMap(Map<String, dynamic> data) => AnswersStruct(
        type: deserializeEnum<AnswerType>(data['type']),
        possibleAnswers: getDataList(data['possible_answers']),
      );

  static AnswersStruct? maybeFromMap(dynamic data) =>
      data is Map ? AnswersStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type?.serialize(),
        'possible_answers': _possibleAnswers,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'possible_answers': serializeParam(
          _possibleAnswers,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static AnswersStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnswersStruct(
        type: deserializeParam<AnswerType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        possibleAnswers: deserializeParam<String>(
          data['possible_answers'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'AnswersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AnswersStruct &&
        type == other.type &&
        listEquality.equals(possibleAnswers, other.possibleAnswers);
  }

  @override
  int get hashCode => const ListEquality().hash([type, possibleAnswers]);
}

AnswersStruct createAnswersStruct({
  AnswerType? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnswersStruct(
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnswersStruct? updateAnswersStruct(
  AnswersStruct? answers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    answers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnswersStructData(
  Map<String, dynamic> firestoreData,
  AnswersStruct? answers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (answers == null) {
    return;
  }
  if (answers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && answers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final answersData = getAnswersFirestoreData(answers, forFieldValue);
  final nestedData = answersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = answers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnswersFirestoreData(
  AnswersStruct? answers, [
  bool forFieldValue = false,
]) {
  if (answers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(answers.toMap());

  // Add any Firestore field values
  answers.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnswersListFirestoreData(
  List<AnswersStruct>? answerss,
) =>
    answerss?.map((e) => getAnswersFirestoreData(e, true)).toList() ?? [];
