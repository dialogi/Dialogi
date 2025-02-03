import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeacherNewRecord extends FirestoreRecord {
  TeacherNewRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "voice" field.
  String? _voice;
  String get voice => _voice ?? '';
  bool hasVoice() => _voice != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _voice = snapshotData['voice'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('teacherNew');

  static Stream<TeacherNewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeacherNewRecord.fromSnapshot(s));

  static Future<TeacherNewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeacherNewRecord.fromSnapshot(s));

  static TeacherNewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TeacherNewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeacherNewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeacherNewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeacherNewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeacherNewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeacherNewRecordData({
  String? name,
  String? image,
  String? voice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'voice': voice,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeacherNewRecordDocumentEquality implements Equality<TeacherNewRecord> {
  const TeacherNewRecordDocumentEquality();

  @override
  bool equals(TeacherNewRecord? e1, TeacherNewRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.voice == e2?.voice;
  }

  @override
  int hash(TeacherNewRecord? e) =>
      const ListEquality().hash([e?.name, e?.image, e?.voice]);

  @override
  bool isValidKey(Object? o) => o is TeacherNewRecord;
}
