import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LevelsRecord extends FirestoreRecord {
  LevelsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "precent" field.
  int? _precent;
  int get precent => _precent ?? 0;
  bool hasPrecent() => _precent != null;

  void _initializeFields() {
    _user = snapshotData['user'] as String?;
    _subject = snapshotData['subject'] as String?;
    _precent = castToType<int>(snapshotData['precent']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('levels');

  static Stream<LevelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LevelsRecord.fromSnapshot(s));

  static Future<LevelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LevelsRecord.fromSnapshot(s));

  static LevelsRecord fromSnapshot(DocumentSnapshot snapshot) => LevelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LevelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LevelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LevelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LevelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLevelsRecordData({
  String? user,
  String? subject,
  int? precent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'subject': subject,
      'precent': precent,
    }.withoutNulls,
  );

  return firestoreData;
}

class LevelsRecordDocumentEquality implements Equality<LevelsRecord> {
  const LevelsRecordDocumentEquality();

  @override
  bool equals(LevelsRecord? e1, LevelsRecord? e2) {
    return e1?.user == e2?.user &&
        e1?.subject == e2?.subject &&
        e1?.precent == e2?.precent;
  }

  @override
  int hash(LevelsRecord? e) =>
      const ListEquality().hash([e?.user, e?.subject, e?.precent]);

  @override
  bool isValidKey(Object? o) => o is LevelsRecord;
}
