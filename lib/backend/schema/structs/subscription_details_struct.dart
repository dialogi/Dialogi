// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionDetailsStruct extends FFFirebaseStruct {
  SubscriptionDetailsStruct({
    String? subId,
    bool? ttsHD,
    String? name,
    bool? pronunciation,
    int? frequencyPerWeek,
    int? lessonLimit,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subId = subId,
        _ttsHD = ttsHD,
        _name = name,
        _pronunciation = pronunciation,
        _frequencyPerWeek = frequencyPerWeek,
        _lessonLimit = lessonLimit,
        super(firestoreUtilData);

  // "subId" field.
  String? _subId;
  String get subId => _subId ?? '';
  set subId(String? val) => _subId = val;

  bool hasSubId() => _subId != null;

  // "ttsHD" field.
  bool? _ttsHD;
  bool get ttsHD => _ttsHD ?? false;
  set ttsHD(bool? val) => _ttsHD = val;

  bool hasTtsHD() => _ttsHD != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "pronunciation" field.
  bool? _pronunciation;
  bool get pronunciation => _pronunciation ?? false;
  set pronunciation(bool? val) => _pronunciation = val;

  bool hasPronunciation() => _pronunciation != null;

  // "frequencyPerWeek" field.
  int? _frequencyPerWeek;
  int get frequencyPerWeek => _frequencyPerWeek ?? 0;
  set frequencyPerWeek(int? val) => _frequencyPerWeek = val;

  void incrementFrequencyPerWeek(int amount) =>
      frequencyPerWeek = frequencyPerWeek + amount;

  bool hasFrequencyPerWeek() => _frequencyPerWeek != null;

  // "lessonLimit" field.
  int? _lessonLimit;
  int get lessonLimit => _lessonLimit ?? 0;
  set lessonLimit(int? val) => _lessonLimit = val;

  void incrementLessonLimit(int amount) => lessonLimit = lessonLimit + amount;

  bool hasLessonLimit() => _lessonLimit != null;

  static SubscriptionDetailsStruct fromMap(Map<String, dynamic> data) =>
      SubscriptionDetailsStruct(
        subId: data['subId'] as String?,
        ttsHD: data['ttsHD'] as bool?,
        name: data['name'] as String?,
        pronunciation: data['pronunciation'] as bool?,
        frequencyPerWeek: castToType<int>(data['frequencyPerWeek']),
        lessonLimit: castToType<int>(data['lessonLimit']),
      );

  static SubscriptionDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? SubscriptionDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'subId': _subId,
        'ttsHD': _ttsHD,
        'name': _name,
        'pronunciation': _pronunciation,
        'frequencyPerWeek': _frequencyPerWeek,
        'lessonLimit': _lessonLimit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subId': serializeParam(
          _subId,
          ParamType.String,
        ),
        'ttsHD': serializeParam(
          _ttsHD,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'pronunciation': serializeParam(
          _pronunciation,
          ParamType.bool,
        ),
        'frequencyPerWeek': serializeParam(
          _frequencyPerWeek,
          ParamType.int,
        ),
        'lessonLimit': serializeParam(
          _lessonLimit,
          ParamType.int,
        ),
      }.withoutNulls;

  static SubscriptionDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SubscriptionDetailsStruct(
        subId: deserializeParam(
          data['subId'],
          ParamType.String,
          false,
        ),
        ttsHD: deserializeParam(
          data['ttsHD'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        pronunciation: deserializeParam(
          data['pronunciation'],
          ParamType.bool,
          false,
        ),
        frequencyPerWeek: deserializeParam(
          data['frequencyPerWeek'],
          ParamType.int,
          false,
        ),
        lessonLimit: deserializeParam(
          data['lessonLimit'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SubscriptionDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubscriptionDetailsStruct &&
        subId == other.subId &&
        ttsHD == other.ttsHD &&
        name == other.name &&
        pronunciation == other.pronunciation &&
        frequencyPerWeek == other.frequencyPerWeek &&
        lessonLimit == other.lessonLimit;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([subId, ttsHD, name, pronunciation, frequencyPerWeek, lessonLimit]);
}

SubscriptionDetailsStruct createSubscriptionDetailsStruct({
  String? subId,
  bool? ttsHD,
  String? name,
  bool? pronunciation,
  int? frequencyPerWeek,
  int? lessonLimit,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubscriptionDetailsStruct(
      subId: subId,
      ttsHD: ttsHD,
      name: name,
      pronunciation: pronunciation,
      frequencyPerWeek: frequencyPerWeek,
      lessonLimit: lessonLimit,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubscriptionDetailsStruct? updateSubscriptionDetailsStruct(
  SubscriptionDetailsStruct? subscriptionDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subscriptionDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubscriptionDetailsStructData(
  Map<String, dynamic> firestoreData,
  SubscriptionDetailsStruct? subscriptionDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subscriptionDetails == null) {
    return;
  }
  if (subscriptionDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subscriptionDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subscriptionDetailsData =
      getSubscriptionDetailsFirestoreData(subscriptionDetails, forFieldValue);
  final nestedData =
      subscriptionDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      subscriptionDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubscriptionDetailsFirestoreData(
  SubscriptionDetailsStruct? subscriptionDetails, [
  bool forFieldValue = false,
]) {
  if (subscriptionDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subscriptionDetails.toMap());

  // Add any Firestore field values
  subscriptionDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubscriptionDetailsListFirestoreData(
  List<SubscriptionDetailsStruct>? subscriptionDetailss,
) =>
    subscriptionDetailss
        ?.map((e) => getSubscriptionDetailsFirestoreData(e, true))
        .toList() ??
    [];
