import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAnswersRecord extends FirestoreRecord {
  UserAnswersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  // "answer" field.
  List<String>? _answer;
  List<String> get answer => _answer ?? const [];
  bool hasAnswer() => _answer != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  void _initializeFields() {
    _user = snapshotData['user'] as String?;
    _answer = getDataList(snapshotData['answer']);
    _question = snapshotData['question'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_answers');

  static Stream<UserAnswersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserAnswersRecord.fromSnapshot(s));

  static Future<UserAnswersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserAnswersRecord.fromSnapshot(s));

  static UserAnswersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserAnswersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserAnswersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserAnswersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserAnswersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserAnswersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserAnswersRecordData({
  String? user,
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserAnswersRecordDocumentEquality implements Equality<UserAnswersRecord> {
  const UserAnswersRecordDocumentEquality();

  @override
  bool equals(UserAnswersRecord? e1, UserAnswersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        listEquality.equals(e1?.answer, e2?.answer) &&
        e1?.question == e2?.question;
  }

  @override
  int hash(UserAnswersRecord? e) =>
      const ListEquality().hash([e?.user, e?.answer, e?.question]);

  @override
  bool isValidKey(Object? o) => o is UserAnswersRecord;
}
