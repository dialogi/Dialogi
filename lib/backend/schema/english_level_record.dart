import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnglishLevelRecord extends FirestoreRecord {
  EnglishLevelRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  bool hasValue() => _value != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _value = snapshotData['value'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('englishLevel');

  static Stream<EnglishLevelRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EnglishLevelRecord.fromSnapshot(s));

  static Future<EnglishLevelRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EnglishLevelRecord.fromSnapshot(s));

  static EnglishLevelRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EnglishLevelRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EnglishLevelRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EnglishLevelRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EnglishLevelRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EnglishLevelRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEnglishLevelRecordData({
  String? text,
  String? value,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'value': value,
    }.withoutNulls,
  );

  return firestoreData;
}

class EnglishLevelRecordDocumentEquality
    implements Equality<EnglishLevelRecord> {
  const EnglishLevelRecordDocumentEquality();

  @override
  bool equals(EnglishLevelRecord? e1, EnglishLevelRecord? e2) {
    return e1?.text == e2?.text && e1?.value == e2?.value;
  }

  @override
  int hash(EnglishLevelRecord? e) =>
      const ListEquality().hash([e?.text, e?.value]);

  @override
  bool isValidKey(Object? o) => o is EnglishLevelRecord;
}
