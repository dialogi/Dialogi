// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TeachersObjStruct extends FFFirebaseStruct {
  TeachersObjStruct({
    String? image,
    String? name,
    String? voice,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _name = name,
        _voice = voice,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "voice" field.
  String? _voice;
  String get voice => _voice ?? '';
  set voice(String? val) => _voice = val;

  bool hasVoice() => _voice != null;

  static TeachersObjStruct fromMap(Map<String, dynamic> data) =>
      TeachersObjStruct(
        image: data['image'] as String?,
        name: data['name'] as String?,
        voice: data['voice'] as String?,
      );

  static TeachersObjStruct? maybeFromMap(dynamic data) => data is Map
      ? TeachersObjStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'name': _name,
        'voice': _voice,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'voice': serializeParam(
          _voice,
          ParamType.String,
        ),
      }.withoutNulls;

  static TeachersObjStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeachersObjStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        voice: deserializeParam(
          data['voice'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TeachersObjStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeachersObjStruct &&
        image == other.image &&
        name == other.name &&
        voice == other.voice;
  }

  @override
  int get hashCode => const ListEquality().hash([image, name, voice]);
}

TeachersObjStruct createTeachersObjStruct({
  String? image,
  String? name,
  String? voice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeachersObjStruct(
      image: image,
      name: name,
      voice: voice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeachersObjStruct? updateTeachersObjStruct(
  TeachersObjStruct? teachersObj, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teachersObj
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeachersObjStructData(
  Map<String, dynamic> firestoreData,
  TeachersObjStruct? teachersObj,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teachersObj == null) {
    return;
  }
  if (teachersObj.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && teachersObj.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teachersObjData =
      getTeachersObjFirestoreData(teachersObj, forFieldValue);
  final nestedData =
      teachersObjData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = teachersObj.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeachersObjFirestoreData(
  TeachersObjStruct? teachersObj, [
  bool forFieldValue = false,
]) {
  if (teachersObj == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teachersObj.toMap());

  // Add any Firestore field values
  teachersObj.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeachersObjListFirestoreData(
  List<TeachersObjStruct>? teachersObjs,
) =>
    teachersObjs?.map((e) => getTeachersObjFirestoreData(e, true)).toList() ??
    [];
